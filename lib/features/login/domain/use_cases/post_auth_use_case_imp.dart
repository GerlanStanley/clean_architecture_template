import 'package:dartz/dartz.dart';

import '../../../../core/common/strings/texts.dart';
import '../../../../core/common/utils/utils.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/repositories.dart';

import 'use_cases.dart';

class PostAuthUseCaseImp implements IPostAuthUseCase {
  final PostAuthRepository _postAuthRepository;

  PostAuthUseCaseImp(this._postAuthRepository);

  @override
  Future<Either<PostAuthError, AuthEntity>> call(AuthUseCaseParams params) async {
    if (!Validation.isEmail(params.email)) {
      return Left(ValidationPostAuthError(
        message: Texts.loginPage.emailErrorUseCase,
      ));
    }
    else if (params.password.isEmpty) {
      return Left(ValidationPostAuthError(
        message: Texts.loginPage.passwordEmptyUseCase,
      ));
    }

    return _postAuthRepository(params);
  }
}
