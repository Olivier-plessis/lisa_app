import 'package:app_authentication/common/domain/models/user_credentials.dart';

abstract class IAuthLocalDataSource {
  Future<dynamic> storeUserCredentials(UserCredentials userCredentials);
  Future<UserCredentials> getUserCredentials();
  Future<void> deleteAllData();
}
