import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segment/src/modules/connection/domain/connection_mode.dart';
import 'package:segment/src/modules/settings/data/settings_repo.dart';
import 'package:segment/src/modules/settings/domain/settings_model.dart';
import 'package:segment/src/shared/domain/proxy_cores_types.dart';

final settingsModalControllerProvider =
    NotifierProvider<SettingsModalController, SettingsModel>(
        SettingsModalController.new);

class SettingsModalController extends Notifier<SettingsModel> {
  SettingsModalController();

  @override
  SettingsModel build() {
    final settings = ref.watch(settingsRepoProvider).settings;
    return settings;
  }

  void updateCoreType(ProxyCoresTypes coreType) {
    state = state.copyWith(coreType: coreType);
  }

  void updateConnectionType(ConnectionLoadType connectionType) {
    state = state.copyWith(connectionLoadType: connectionType);
  }

  void updateConnectionMode(ConnectionMode connectionMode) {
    state = state.copyWith(connectionMode: connectionMode);
  }

  void updateSettings() {
    ref.read(settingsRepoProvider).settings = state;
    ref.read(connectionModeProvider.notifier).state = state.connectionMode;
  }

  void restoreDefaults() {
    state = ref.read(settingsRepoProvider).defaultSettings;
  }
}
