import 'dart:io';

import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dio/dio.dart';
import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:retrofit/retrofit.dart';

part 'api_google_client.g.dart';

@RestApi()
abstract class ApiGoogleClient {
  factory ApiGoogleClient.createDefault(Dio dio) = _ApiGoogleClient;

  @GET('?q={query}&startIndex=0&maxResults=40')
  Future<Book> searchBooks(@Path('query') String query);

  @GET('/{id}')
  Future<SingleBook> showBooksDetails(@Path('id') String id);
}

extension NetworkHandler on DioError {
  Failure handleFailure() {
    if (error is SocketException ||
        type == DioErrorType.connectTimeout ||
        type == DioErrorType.other) {
      return const Failure.offline();
    }

    switch (response!.statusCode) {
      case 500:
        return const Failure.serverError();

      case 403:
      case 401:
        {
          return const Failure.unauthorizedAccess();
        }
      default:
        return const Failure.unexpectedDataError();
    }
  }
}
