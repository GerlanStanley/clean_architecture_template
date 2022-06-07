import '../../../../core/failures/failures.dart';
import '../../../../core/services/http/http.dart';

import '../../domain/failures/failures.dart';
import '../../domain/use_cases/use_cases.dart';
import '../../infra/data_sources/data_sources.dart';
import '../../infra/dtos/dtos.dart';

class AuthDataSourceImp implements AuthDataSource {
  final IHttpService _httpService;

  AuthDataSourceImp(this._httpService);

  @override
  Future<AuthDto> postLogin(AuthUseCaseParams params) async {
    try {
      Map response = await _httpService.post("me/token", data: {
        "login": params.email,
        "password": params.password,
      });

      return AuthDto.fromJson(response);
    }
    on HttpFailure {
      rethrow;
    }
    catch (e) {
      throw DtoPostAuthFailure(message: e.toString());
    }
  }
}