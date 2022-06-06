import '../../domain/use_cases/use_cases.dart';

abstract class PostAuthDataSource {
  Future<Map> call(AuthUseCaseParams params);
}