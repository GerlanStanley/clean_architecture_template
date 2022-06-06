import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class IPostAuthUseCase {
  Future<Either<PostAuthError, AuthEntity>> call(AuthUseCaseParams params);
}

class AuthUseCaseParams {
  final String email;
  final String password;

  AuthUseCaseParams({
    required this.email,
    required this.password,
  });
}
