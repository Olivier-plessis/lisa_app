import 'package:app_authentication/common/domain/models/models.dart';

abstract class IUserProvider {
  String get id;
  String get firebaseDocPath;
  Future<void> setup();
  Future<void> deleteUserData();
  Stream<User> get userChanges;
}
