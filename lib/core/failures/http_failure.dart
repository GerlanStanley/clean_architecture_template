import 'failure.dart';

class HttpError extends Failure {
  HttpError({required String message}) : super(message: message);
}

class BadRequestHttpError extends HttpError {
  BadRequestHttpError({required String message}) : super(message: message);
}

class UnauthorizedHttpError extends HttpError {
  UnauthorizedHttpError({required String message}) : super(message: message);
}

class NotFoundHttpError extends HttpError {
  NotFoundHttpError({required String message}) : super(message: message);
}

class ServerHttpError extends HttpError {
  ServerHttpError({required String message}) : super(message: message);
}