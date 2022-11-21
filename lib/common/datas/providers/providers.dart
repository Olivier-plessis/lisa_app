import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/datasources/api_google_client.dart';
import 'package:lisa_app/common/datas/datasources/favorite_data_sources.dart';
import 'package:lisa_app/common/datas/repositories/book_repository.dart';
import 'package:lisa_app/common/datas/repositories/favorite_repository.dart';
import 'package:lisa_app/common/datas/utils/logger_interceptor.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/notifier/book_notifier.dart';
import 'package:lisa_app/common/domain/notifier/favorite_list_notifier.dart';
import 'package:lisa_app/common/domain/notifier/favorite_notifier.dart';
import 'package:lisa_app/common/domain/notifier/single_book_notifier.dart';
import 'package:lisa_app/common/domain/state/book_state.dart';
import 'package:lisa_app/common/domain/state/favorite/favorite_list_state.dart';
import 'package:lisa_app/common/domain/state/favorite/favorite_state.dart';
import 'package:lisa_app/common/domain/state/single_book_state.dart';
import 'package:lisa_app/main/app_environment.dart';

final Provider<Dio> dioProvider = Provider<Dio>((ProviderRef<Dio> ref) {
  final Dio instance = Dio(BaseOptions(
    baseUrl: EnvInfo.connectionString,
    contentType: 'application/json',
  ));

  instance.interceptors.add(LoggerInterceptor());
  return instance;
});

//API
final Provider<ApiGoogleClient> apiClientProvider = Provider<ApiGoogleClient>(
    (ProviderRef<ApiGoogleClient> ref) =>
        ApiGoogleClient.createDefault(ref.watch(dioProvider)));

//Books
final Provider<BookRepository> bookRepositoryProvider =
    Provider<BookRepository>((ProviderRef<BookRepository> ref) =>
        BookRepository(ref.watch(apiClientProvider)));

final AutoDisposeStateNotifierProvider<BookNotifier, BookState>
    booksNotifierProvider =
    StateNotifierProvider.autoDispose<BookNotifier, BookState>(
        (AutoDisposeStateNotifierProviderRef<BookNotifier, BookState> ref) {
  return BookNotifier(ref.watch(bookRepositoryProvider));
});

final AutoDisposeStateNotifierProviderFamily<SingleBookNotifier,
        SingleBookState, String> singleBookFamilyProvider =
    StateNotifierProvider.autoDispose
        .family<SingleBookNotifier, SingleBookState, String>(
  (AutoDisposeStateNotifierProviderRef<SingleBookNotifier, SingleBookState> ref,
          String bookId) =>
      SingleBookNotifier(ref.watch(bookRepositoryProvider), bookId: bookId),
);

//Firebase
final Provider<FirebaseFirestore> firebaseFirestoreProvider =
    Provider<FirebaseFirestore>(
        (ProviderRef<FirebaseFirestore> ref) => FirebaseFirestore.instance);
final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>(
    (ProviderRef<FirebaseAuth> ref) => FirebaseAuth.instance);

//Favourites
final Provider<FavoriteDataSource> favoriteDataSourceProvider =
    Provider<FavoriteDataSource>((ProviderRef<FavoriteDataSource> ref) =>
        FavoriteDataSource(ref.read(firebaseAuthProvider),
            ref.read(firebaseFirestoreProvider)));

final Provider<FavoriteRepository> favoriteRepositoryProvider =
    Provider<FavoriteRepository>((ProviderRef<FavoriteRepository> ref) =>
        FavoriteRepository(ref.watch(favoriteDataSourceProvider)));

final StateNotifierProvider<FavoriteNotifier, FavoriteState>
    favoriteNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>(
  (StateNotifierProviderRef<FavoriteNotifier, FavoriteState> ref) =>
      FavoriteNotifier(
    ref.watch(favoriteRepositoryProvider),
  ),
);

final AutoDisposeStateNotifierProvider<FavoriteListNotifier, FavoriteListState>
    favoriteListNotifierProvider =
    StateNotifierProvider.autoDispose<FavoriteListNotifier, FavoriteListState>(
  (AutoDisposeStateNotifierProviderRef<FavoriteListNotifier, FavoriteListState>
          ref) =>
      FavoriteListNotifier(
    ref.watch(favoriteRepositoryProvider),
  ),
);

final AutoDisposeProvider<List<SingleBook>> favoritesListProvider =
    Provider.autoDispose<List<SingleBook>>(
        (AutoDisposeProviderRef<List<SingleBook>> ref) {
  final List<SingleBook> favoriteList = ref
      .watch(favoriteListNotifierProvider)
      .maybeMap(
          orElse: () => <SingleBook>[], loaded: (state) => state.singleBooks);

  return favoriteList;
});
