import '../../../../core/errors/errors.dart';

class PostAuthError extends HttpError {
  PostAuthError({required String message}) : super(message: message);
}

class ValidationPostAuthError extends PostAuthError {
  ValidationPostAuthError({required String message}) : super(message: message);
}

class DtoPostAuthError extends PostAuthError {
  DtoPostAuthError({required String message}) : super(message: message);
}