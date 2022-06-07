import 'failure.dart';

class HttpFailure extends Failure {
  HttpFailure({required String message}) : super(message: message);
}

class BadRequestHttpFailure extends HttpFailure {
  BadRequestHttpFailure({required String message}) : super(message: message);
}

class UnauthorizedHttpFailure extends HttpFailure {
  UnauthorizedHttpFailure({required String message}) : super(message: message);
}

class NotFoundHttpFailure extends HttpFailure {
  NotFoundHttpFailure({required String message}) : super(message: message);
}

class ServerHttpFailure extends HttpFailure {
  ServerHttpFailure({required String message}) : super(message: message);
}