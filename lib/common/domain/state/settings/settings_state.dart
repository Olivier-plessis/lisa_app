import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/state/settings/settings_details.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsStateInitial;
  const factory SettingsState.loading() = _SettingsStateLoading;
  const factory SettingsState.data({required SettingsDetails details}) =
      _SetttingsStateData;
  const factory SettingsState.error({String? error}) = _SettingsStateError;
}
