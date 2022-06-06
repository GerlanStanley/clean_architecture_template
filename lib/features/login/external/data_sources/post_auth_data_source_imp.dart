import 'package:dio/dio.dart';

import '../../../../core/domain/services/http_service.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/use_cases/use_cases.dart';
import '../../infra/data_sources/data_sources.dart';

class PostAuthDataSourceImp implements PostAuthDataSource {
  final IHttpService _httpService;

  PostAuthDataSourceImp(this._httpService);

  @override
  Future<Map> call(AuthUseCaseParams params) async {
    Response response = await _httpService.post("me/token", data: {
      "login": params.email,
      "password": params.password,
    });

    if (response.statusCode == 200) {
      return response.data;
    }
    else if (response.statusCode == 400) {
      throw BadRequestHttpError(message: "Erro na requisição");
    }
    else if (response.statusCode == 401) {
      throw UnauthorizedHttpError(message: "Erro na requisição");
    }
    else if (response.statusCode == 404) {
      throw NotFoundHttpError(message: "Erro na requisição");
    }
    else if (response.statusCode == 500) {
      throw ServerHttpError(message: "Erro na requisição");
    }
    else {
      throw HttpError(message: "Erro na requisição");
    }
  }
}