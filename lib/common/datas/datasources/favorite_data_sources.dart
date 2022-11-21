import 'dart:async';

import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lisa_app/common/datas/datasources/firebase_collections.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

abstract class IFavoriteRemoteDataSource {
  Future<Unit> addBookToFavorite({required SingleBook book});
  Future<Unit> removeFavorite({required SingleBook book});
  Stream<List<SingleBook>> getFavorites();
}

class FavoriteDataSource implements IFavoriteRemoteDataSource {
  FavoriteDataSource(this._firebaseAuth, this._firebaseFirestore);

  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firebaseFirestore;

  @override
  Future<Unit> addBookToFavorite({required SingleBook book}) async {
    try {
      final User? user = _firebaseAuth.currentUser;

      await _firebaseFirestore
          .collection(Collections.users)
          .doc(user!.uid)
          .collection(Collections.favourites)
          .add(book.toJson());

      return unit;
    } on FirebaseException catch (e) {
      throw DataSourceException(message: e.message);
    }
  }

  @override
  Stream<List<SingleBook>> getFavorites() async* {
    try {
      final User? user = _firebaseAuth.currentUser;

      yield* FirebaseFirestore.instance
          .collection(Collections.users)
          .doc(user!.uid)
          .collection(Collections.favourites)
          .snapshots()
          .transform(
            StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
                List<SingleBook>>.fromHandlers(
              handleData: (QuerySnapshot<Map<String, dynamic>> json,
                      EventSink<List<SingleBook>> sink) =>
                  sink.add(
                json.docs
                    .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
                        SingleBook.fromJson(e.data()))
                    .toList(),
              ),
            ),
          );
    } on FirebaseException catch (e) {
      throw DataSourceException(message: e.message);
    }
  }

  @override
  Future<Unit> removeFavorite({required SingleBook book}) async {
    try {
      final User? user = _firebaseAuth.currentUser;
      final QuerySnapshot<Map<String, dynamic>> removingBook =
          await FirebaseFirestore.instance
              .collection(Collections.users)
              .doc(user!.uid)
              .collection(Collections.favourites)
              .where('id', isEqualTo: book.id)
              .get();

      removingBook.docs.first.reference.delete();

      return unit;
    } on FirebaseException catch (e) {
      throw DataSourceException(message: e.message);
    }
  }
}
