import 'package:dio/dio.dart';

import '../../domain/services/http_service.dart';

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
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data}) {
    return _dio.post<T>(
      path,
      data: data,
    );
  }
}
