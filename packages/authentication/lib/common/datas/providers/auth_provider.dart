import 'package:app_authentication/common/domain/notifier/auth_notifier.dart';
import 'package:app_authentication/common/utils/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app_authentication/common/datas/states/state.dart';
import 'package:app_authentication/common/datas/datasources/datasources.dart';
import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/providers/current_user_provider.dart';
import 'package:app_authentication/common/datas/repositories/repositories.dart';

final Provider<FlutterSecureStorage> storageDatabase =
    Provider<FlutterSecureStorage>((ProviderRef<FlutterSecureStorage> ref) =>
        const FlutterSecureStorage());

final Provider<IUserProvider> userProvider = Provider<IUserProvider>(
    (ProviderRef<IUserProvider> ref) => CurrentUserProvider());

final Provider<FirebaseFirestore> firebaseFirestoreProvider =
    Provider<FirebaseFirestore>(
        (ProviderRef<FirebaseFirestore> ref) => FirebaseFirestore.instance);

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>(
    (ProviderRef<FirebaseAuth> ref) => FirebaseAuth.instance);

final Provider<IRemoteDataSources> authRemoteDataSourceProvider =
    Provider<IRemoteDataSources>((ProviderRef<IRemoteDataSources> ref) =>
        FirebaseAuthenticationDatasource(
          ref.watch(firebaseAuthProvider),
          ref.watch(firebaseFirestoreProvider),
          ref.watch(userProvider),
        ));

final Provider<IAuthLocalDataSource> authLocalDataSourceProvider =
    Provider<IAuthLocalDataSource>((ProviderRef<IAuthLocalDataSource> ref) =>
        SecureStorageAuthDataSource(ref: ref));

final Provider<INetworkInfo> networkInfoProvider = Provider<INetworkInfo>(
  (ProviderRef<INetworkInfo> ref) => ConnectivityNetworkInfo(
    Connectivity(),
  ),
);

final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
  (ProviderRef<AuthRepository> ref) => AuthRepository(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  ),
);

final Provider<FirebaseUserRepository> userRepositoryProvider =
    Provider<FirebaseUserRepository>(
  (ProviderRef<FirebaseUserRepository> ref) => FirebaseUserRepository(
    ref.watch(networkInfoProvider),
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  ),
);

final StateNotifierProvider<AuthNotifier, AuthState> authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (StateNotifierProviderRef<AuthNotifier, AuthState> ref) => AuthNotifier(
    ref.watch(userProvider),
    ref.watch(authRepositoryProvider),
    ref.watch(userRepositoryProvider),
  ),
);
