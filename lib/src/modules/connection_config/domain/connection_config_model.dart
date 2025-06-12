import 'dart:convert';

import 'package:proxy_url_parser/proxy_url_parser.dart';

class ConnectionConfigModel {
  ConnectionConfigModel._({
    required this.rawConfig,
    required this.configLink,
  });

  final Map<String, dynamic> rawConfig;
  final String? configLink;
  // String get configName => rawConfig['outbounds'][0]['remark'];
  String get configName =>
      rawConfig.entries.firstWhere((e) => e.key == 'remark').value;

  factory ConnectionConfigModel.fromJson(Map<String, dynamic> json) {
    return ConnectionConfigModel._(
      rawConfig: json,
      configLink: null,
    );
  }

  // TODO: As SingBox is not yet supported, this works for xray only
  factory ConnectionConfigModel.fromLink(String link) {
    final xrayConfig =
        ProxyUrlParser.parse(link).toXrayJson(allowInsecure: true);

    final fullConfig = ProxyUrlParser.injectToConfig(_baseConfig, xrayConfig);

    // patch for xray rules
    fullConfig['outbounds'][0]['tag'] = 'proxy';

    return ConnectionConfigModel._(
      rawConfig: fullConfig,
      configLink: link,
    );
  }

  /// Returns link if [configLink] is not null and raw config otherwise
  String get asStringValue => configLink ?? rawConfig.toString();

  String get asStringJson => jsonEncode(rawConfig);

  static const _baseConfig = {
    "log": {"level": "debug"},
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 2080,
        "protocol": "socks",
        "settings": {"auth": "noauth", "udp": true},
        "sniffing": {
          "destOverride": ["http", "tls", "quic", "fakedns"],
          "enabled": false,
          "routeOnly": true
        },
        "tag": "socks"
      }
    ],
    "dns": {
      "servers": ["1.1.1.1", "8.8.8.8"]
    },
    "routing": {
      "rules": [
        {
          "type": "field",
          "inboundTag": ["socks"],
          "outboundTag": "proxy"
        }
      ]
    },
  };
}
