import 'package:clean_architecture_template/features/login/infra/dtos/auth_dto.dart';

import '../../domain/use_cases/use_cases.dart';

abstract class IAuthDataSource {
  Future<AuthDto> postLogin(AuthUseCaseParams params);
}