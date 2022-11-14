import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/providers/auth_provider.dart';
import 'package:app_authentication/common/datas/states/state.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecureStorageAuthDataSource extends StateNotifier<AuthState>
    implements IAuthLocalDataSource {
  SecureStorageAuthDataSource({required this.ref})
      : super(const AuthState.authenticated());

  static const String _uidKey = 'uid';
  static const String _emailKey = 'email';
  static const String _nameKey = 'name';
  static const String _photoKey = 'photo';
  late final Ref ref;

  @override
  Future<dynamic> storeUserCredentials(UserCredentials userCredentials) async {
    try {
      ref.watch(storageDatabase).write(
            key: _uidKey,
            value: userCredentials.email,
          );
      ref.watch(storageDatabase).write(
            key: _emailKey,
            value: userCredentials.email,
          );
      ref.watch(storageDatabase).write(
            key: _nameKey,
            value: userCredentials.name,
          );
      ref.watch(storageDatabase).write(
            key: _photoKey,
            value: userCredentials.photo,
          );
    } on Exception {
      throw AuthLocalDataSourceException();
    }
  }

  @override
  Future<UserCredentials> getUserCredentials() async {
    try {
      state = const AuthState.authenticated();
      final String? uid = await ref.watch(storageDatabase).read(key: _uidKey);
      final String? email =
          await ref.watch(storageDatabase).read(key: _emailKey);
      final String? name = await ref.watch(storageDatabase).read(key: _nameKey);
      final String? photo =
          await ref.watch(storageDatabase).read(key: _photoKey);

      UserCredentials user = UserCredentials(
          uid: uid.toString(),
          email: email.toString(),
          name: name.toString(),
          photo: photo.toString());

      state = AuthState.authenticatedUser(user: user);
      return user;
    } on Exception {
      throw AuthLocalDataSourceException();
    }
  }

  @override
  Future<void> deleteAllData() async {
    try {
      ref.watch(storageDatabase).deleteAll;
    } on Exception {
      throw AuthLocalDataSourceException();
    }
  }
}
