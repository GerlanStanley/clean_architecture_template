import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/use_cases/use_cases.dart';

import '../data_sources/data_sources.dart';

class PostAuthRepositoryImp implements IAuthRepository {
  final AuthDataSource _dataSource;

  PostAuthRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthUseCaseParams params) async {
    try {
      final result = await _dataSource.postLogin(params);
      return Right(result);
    }
    on Failure catch (e) {
      return Left(e);
    }
  }
}