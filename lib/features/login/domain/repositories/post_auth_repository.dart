import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../entities/entities.dart';
import '../use_cases/use_cases.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AuthEntity>> call(AuthUseCaseParams params);
}