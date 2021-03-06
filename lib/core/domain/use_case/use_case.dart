import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../failures/failure.dart';

abstract class IUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}