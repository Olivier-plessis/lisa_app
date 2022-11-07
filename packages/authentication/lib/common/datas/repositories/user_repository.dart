import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:app_authentication/common/domain/models/user.dart';

import '../firebase_collections.dart';

class FirebaseUserRepository implements IUserRepository {
  FirebaseUserRepository(
    this._networkInfo,
    this._firebaseFirestore,
    this._firebaseAuth,
  );

  final FirebaseFirestore _firebaseFirestore;
  final INetworkInfo _networkInfo;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<Either<Failure, User>> createUser({
    required User user,
  }) async {
    if (!(await _networkInfo.isConnected)) {
      return const Left<Failure, User>(Failure.offline());
    }

    final currentUser = _firebaseAuth.currentUser!;

    final User newUser = user.copyWith(
      email: currentUser.email!,
      name: currentUser.displayName!,
      photo: currentUser.photoURL!,
      createdAt: DateTime.now(),
    );
    await _firebaseFirestore
        .doc(collectionPath(currentUser.uid))
        .set(newUser.toJson());

    return Right<Failure, User>(newUser);
  }

  @override
  String collectionPath(String document) => '/${Collections.users}/$document';
}
