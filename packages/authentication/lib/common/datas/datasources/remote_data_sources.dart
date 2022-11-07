import 'package:app_authentication/common/datas/firebase_collections.dart';
import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthenticationDatasource implements IRemoteDataSources {
  FirebaseAuthenticationDatasource(
    this._firebaseAuth,
    this._fireStore,
    this._userProvider,
  );

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;
  final IUserProvider _userProvider;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  Future<UserCredentials> _authenticateWith(
      {required AuthCredential credential}) async {
    try {
      final UserCredential firebaseCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return firebaseCredential.toUserCredentials;
    } on FirebaseAuthException catch (e) {
      throw ExceptionAuth(failureReason: _mapExceptionCodeToMessage(e.code));
    }
  }

  AuthFailureReason _mapExceptionCodeToMessage(String code) {
    switch (code) {
      default:
        return AuthFailureReason.other;
    }
  }

  Future<AuthCredential?> _getAuthCredentials() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuthTokens =
        await googleUser?.authentication;

    if (googleAuthTokens == null) {
      throw const ExceptionAuth(failureReason: AuthFailureReason.googleSignIn);
    }
    return GoogleAuthProvider.credential(
      accessToken: googleAuthTokens.accessToken,
      idToken: googleAuthTokens.idToken,
    );
  }

  @override
  Future<UserCredentials> googleSignIn() async {
    final AuthCredential? credentials = await _getAuthCredentials();

    if (credentials != null) {
      return _authenticateWith(credential: credentials);
    } else {
      throw const ExceptionAuth(failureReason: AuthFailureReason.other);
    }
  }

  Future<void> userSetUp() async => _userProvider.setup();

  @override
  Future<bool> isRegistrationComplete() async {
    try {
      final String uid = _firebaseAuth.currentUser?.uid ?? 'user';
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _fireStore.doc('/${Collections.users}/$uid').get();
      return userDoc.data() != null;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> signOut() => Future.wait(<Future<void>>[
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}

extension _FirebaseUserCredentialsMappable on UserCredential {
  UserCredentials get toUserCredentials => UserCredentials(
        email: user!.email!,
        uid: user!.uid,
        name: user!.displayName!,
        photo: user!.photoURL!,
      );
}
