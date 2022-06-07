import '../../../../core/failures/failure.dart';

class PostAuthFailure extends Failure {
  PostAuthFailure({required String message}) : super(message: message);
}

class ValidationPostAuthFailure extends PostAuthFailure {
  ValidationPostAuthFailure({required String message}) : super(message: message);
}

class DtoPostAuthFailure extends PostAuthFailure {
  DtoPostAuthFailure({required String message}) : super(message: message);
}