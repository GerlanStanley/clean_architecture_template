import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../use_cases/use_cases.dart';

abstract class PostAuthRepository {
  Future<Either<PostAuthError, AuthEntity>> call(AuthUseCaseParams params);
}