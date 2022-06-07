import 'package:get_it/get_it.dart';

import '../../features/login/domain/use_cases/use_cases.dart';


class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp());

    // dataSources

    // repositories

    // useCases
    getIt.registerLazySingleton(() => PostAuthUseCaseImp(getIt()));

    // controllers
  }
}
