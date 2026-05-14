import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/api_client.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'injection_container.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(sl);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => ApiClient.create();

  @lazySingleton
  SimpleBlocObserver get blocObserver => SimpleBlocObserver();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
