import 'package:app_authentication/common/domain/models/models.dart';

abstract class IRemoteDataSources {
  Future<UserCredentials> googleSignIn();
  Future<bool> isRegistrationComplete();
  Future<void> signOut();
}
