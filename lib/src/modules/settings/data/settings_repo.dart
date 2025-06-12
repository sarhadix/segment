import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segment/src/modules/connection/domain/connection_mode.dart';
import 'package:segment/src/modules/settings/domain/settings_model.dart';
import 'package:segment/src/shared/domain/proxy_cores_types.dart';

class SettingRepo {
  final SettingsModel defaultSettings = SettingsModel(
    coreType: ProxyCoresTypes.xray,
    connectionLoadType: ConnectionLoadType.normal,
    connectionMode: ConnectionMode.vpn,
  );

  SettingsModel? _userSettings;

  SettingsModel get settings => _userSettings ?? defaultSettings;

  set settings(SettingsModel? settings) => _userSettings = settings;
}

final settingsRepoProvider = AutoDisposeProvider((ref) {
  return SettingRepo();
});
