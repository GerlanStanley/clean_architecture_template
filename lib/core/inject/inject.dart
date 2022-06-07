import 'package:clean_architecture_template/features/login/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/domain/use_cases/use_cases.dart';
import '../../features/login/external/data_sources/auth_data_source_imp.dart';
import '../../features/login/infra/data_sources/data_sources.dart';
import '../../features/login/infra/repositories/repositories.dart';

import '../services/http/http.dart';


class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp());

    // dataSources
    getIt.registerLazySingleton<IAuthDataSource>(() => AuthDataSourceImp(getIt()));

    // repositories
    getIt.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImp(getIt()));

    // useCases
    getIt.registerLazySingleton(() => PostAuthUseCaseImp(getIt()));

    // controllers
  }
}
