import '../../../../core/errors/failure.dart';

class PostAuthError extends Failure {
  PostAuthError({required String message}) : super(message: message);
}

class ValidationPostAuthError extends PostAuthError {
  ValidationPostAuthError({required String message}) : super(message: message);
}

class DtoPostAuthError extends PostAuthError {
  DtoPostAuthError({required String message}) : super(message: message);
}