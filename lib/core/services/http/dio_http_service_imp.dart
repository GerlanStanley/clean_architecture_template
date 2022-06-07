import 'package:dio/dio.dart';

import '../../failures/failures.dart';
import 'http.dart';

class DioHttpServiceImp implements IHttpService {
  late Dio _dio;

  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://fordevs.herokuapp.com/api/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
        },
      ),
    );
  }

  @override
  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<dynamic> post<T>(String path, {Map<String, dynamic>? data}) {
    return _dio.post<T>(
      path,
      data: data,
    );
  }

  dynamic validateCode(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    }
    else if (response.statusCode == 400) {
      throw BadRequestHttpFailure(message: "Erro na requisição");
    }
    else if (response.statusCode == 401) {
      throw UnauthorizedHttpFailure(message: "Erro na requisição");
    }
    else if (response.statusCode == 404) {
      throw NotFoundHttpFailure(message: "Erro na requisição");
    }
    else if (response.statusCode == 500) {
      throw ServerHttpFailure(message: "Erro na requisição");
    }
    else {
      throw HttpFailure(message: "Erro na requisição");
    }
  }
}
