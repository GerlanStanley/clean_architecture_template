import 'package:clean_architecture_template/core/errors/errors.dart';
import 'package:clean_architecture_template/features/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/use_cases/use_cases.dart';

import '../data_sources/data_sources.dart';
import '../dtos/dtos.dart';

class PostAuthRepositoryImp implements PostAuthRepository {
  final PostAuthDataSource _postAuthDataSource;

  PostAuthRepositoryImp(this._postAuthDataSource);

  @override
  Future<Either<PostAuthError, AuthEntity>> call(AuthUseCaseParams params) async {
    try {
      Map response = await _postAuthDataSource(params);
      return Right(AuthDto.fromJson(response));
    }
    catch (e) {
      if (e is HttpError) Left(e);
      return Left(DtoPostAuthError(message: e.toString()));
    }
  }
}