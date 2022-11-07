import 'package:dartz/dartz.dart';

import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/states.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>> createUser({
    required User user,
  });
  String collectionPath(String document);
}
