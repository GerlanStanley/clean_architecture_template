import 'package:clean_architecture_template/core/infra/services/dio_http_service_imp.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/domain/use_cases/use_cases.dart';

import '../domain/services/http_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp());

    // dataSources

    // repositories

    // useCases
    getIt.registerLazySingleton<IPostAuthUseCase>(
      () => PostAuthUseCaseImp(getIt()),
    );

    // controllers
  }
}
