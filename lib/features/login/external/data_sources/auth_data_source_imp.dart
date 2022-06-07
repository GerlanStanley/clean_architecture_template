import '../../../../core/failures/failures.dart';
import '../../../../core/services/http/http.dart';

import '../../domain/failures/failures.dart';
import '../../domain/use_cases/use_cases.dart';
import '../../infra/data_sources/data_sources.dart';
import '../../infra/dtos/dtos.dart';

class PostAuthDataSourceImp implements PostAuthDataSource {
  final IHttpService _httpService;

  PostAuthDataSourceImp(this._httpService);

  @override
  Future<AuthDto> call(AuthUseCaseParams params) async {
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