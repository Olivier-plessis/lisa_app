import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/state/settings/settings_details.dart';
import 'package:lisa_app/common/domain/state/settings/settings_state.dart';
import 'package:lisa_app/common/utils/theme_mode.dart' as _utils;

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(this.ref) : super(const SettingsState.initial()) {
    loadData();
  }
  final Ref ref;

  late SettingsDetails details;

  Future<void> loadData() async {
    state = const SettingsState.loading();
    final String language =
        (await ref.read(storageDatabase).read(key: 'language')) ??
            _utils.defaultLanguage;
    final String theme = (await ref.read(storageDatabase).read(key: 'theme')) ??
        _utils.defaultTheme;
    details = SettingsDetails(currentLanguage: language, themeMode: theme);
    state = SettingsState.data(details: details);
  }

  Future<void> setLanguage(String language) async {
    state = const SettingsState.loading();
    await ref.read(storageDatabase).write(key: 'language', value: language);
    details = details.copyWith(currentLanguage: language);
    state = SettingsState.data(details: details);
  }

  Future<void> setTheme(String theme) async {
    state = const SettingsState.loading();
    await ref.read(storageDatabase).write(key: 'theme', value: theme);
    details = details.copyWith(themeMode: theme);
    state = SettingsState.data(details: details);
  }
}
