import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/repositories/repositories.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:app_authentication/common/domain/models/user.dart'
    as model_user;
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart' as mock_user;

import 'user_repository_test.mocks.dart';

@GenerateMocks(
    [FirebaseFirestore, INetworkInfo, FirebaseAuth, DocumentReference])
void main() {
  late FirebaseFirestore firebaseFirestore;
  late INetworkInfo networkInfo;
  late FirebaseAuth firebaseAuth;
  late IUserRepository userRepository;
  late DocumentReference<Map<String, dynamic>> documentReference;

  const model_user.User user = model_user.User(
    id: '1',
    email: 'johndoe@gmail.com',
    name: 'john doe',
    photo: 'https://picsum.photos/200/300',
  );

  final mock_user.MockUser firebaseUser = mock_user.MockUser(
    uid: '1',
    email: 'johndoe@gmail.com',
    displayName: 'john doe',
    photoURL: 'https://picsum.photos/200/300',
  );

  setUp(() {
    firebaseFirestore = MockFirebaseFirestore();
    networkInfo = MockINetworkInfo();
    firebaseAuth = MockFirebaseAuth();
    documentReference = MockDocumentReference();
    userRepository =
        FirebaseUserRepository(networkInfo, firebaseFirestore, firebaseAuth);
  });

  group('createUser', () {
    test('Return failure when device is offline', () async {
      when(networkInfo.isConnected)
          .thenAnswer((_) async => Future<bool>.value(false));
      final Either<Failure, model_user.User> result =
          await userRepository.createUser(user: user);
      verify(networkInfo.isConnected);
      expect(result, const Left<Failure, dynamic>(Failure.offline()));
    });

    test('Create user and set it to firebase when device is online', () async {
      when(networkInfo.isConnected)
          .thenAnswer((_) async => Future<bool>.value(true));
      when(firebaseAuth.currentUser).thenReturn(firebaseUser);
      final String collectionPath = userRepository.collectionPath(user.id);
      when(firebaseFirestore.doc(collectionPath)).thenReturn(documentReference);
      when(documentReference.set(user.toJson()));

      final Either<Failure, model_user.User> result =
          await userRepository.createUser(user: user);

      verify(networkInfo.isConnected);
      verify(firebaseAuth.currentUser);
      verify(firebaseFirestore.doc(collectionPath));
      verify(documentReference.set(user.toJson()));
      expect(result, const Right<Failure, model_user.User>(user));
    });
  });
}
