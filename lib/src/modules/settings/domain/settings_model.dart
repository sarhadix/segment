import 'package:segment/src/modules/connection/domain/connection_mode.dart';
import 'package:segment/src/shared/domain/proxy_cores_types.dart';

enum ConnectionLoadType {
  normal,
  loadBalance;
}

class SettingsModel {
  final ProxyCoresTypes coreType;
  final ConnectionLoadType connectionLoadType;
  final ConnectionMode connectionMode;

  const SettingsModel(
      {required this.connectionMode,
      required this.coreType,
      required this.connectionLoadType});

  SettingsModel copyWith({
    ProxyCoresTypes? coreType,
    ConnectionLoadType? connectionLoadType,
    ConnectionMode? connectionMode,
  }) {
    return SettingsModel(
      coreType: coreType ?? this.coreType,
      connectionLoadType: connectionLoadType ?? this.connectionLoadType,
      connectionMode: connectionMode ?? this.connectionMode,
    );
  }
}
