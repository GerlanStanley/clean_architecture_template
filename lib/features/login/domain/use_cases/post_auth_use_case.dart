import 'package:clean_architecture_template/core/domain/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/strings/texts.dart';
import '../../../../core/common/utils/utils.dart';
import '../../../../core/failures/failure.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

class PostAuthUseCase implements IUseCase<AuthEntity, AuthUseCaseParams> {
  final IAuthRepository _postAuthRepository;

  PostAuthUseCase(this._postAuthRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthUseCaseParams params) async {
    if (!Validation.isEmail(params.email)) {
      return Left(ValidationPostAuthFailure(
        message: Texts.loginPage.emailErrorUseCase,
      ));
    }
    else if (params.password.isEmpty) {
      return Left(ValidationPostAuthFailure(
        message: Texts.loginPage.passwordEmptyUseCase,
      ));
    }

    return _postAuthRepository(params);
  }
}

class AuthUseCaseParams {
  final String email;
  final String password;

  AuthUseCaseParams({
    required this.email,
    required this.password,
  });
}
