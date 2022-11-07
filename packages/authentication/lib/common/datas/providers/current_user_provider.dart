import 'package:app_authentication/common/datas/firebase_collections.dart';
import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;

class CurrentUserProvider implements IUserProvider {
  CurrentUserProvider() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((firebase_user.User? event) async {
      _uid = event?.uid;
    });
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _uid;

  @override
  Future<void> setup() async {
    final firebase_user.User user = FirebaseAuth.instance.currentUser!;
    _uid = user.uid;
    if (_uid == null) return;

    final Map<String, dynamic>? userJson =
        (await _firestore.doc(firebaseDocPath).get()).data();
    if (userJson == null) return;
  }

  @override
  Stream<User> get userChanges => _firestore
          .doc(firebaseDocPath)
          .snapshots()
          .map((DocumentSnapshot<Map<String, dynamic>> response) {
        final User user = User.fromJson(response.data()!);
        return user;
      }).asBroadcastStream();

  @override
  Future<void> deleteUserData() async {
    await _firestore.doc(firebaseDocPath).delete();
  }

  @override
  String get id => _uid!;

  @override
  String get firebaseDocPath => '/${Collections.users}/$_uid';
}
