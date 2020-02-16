import 'package:fluro/fluro.dart';
import 'package:flutter_frame/flutter_frame.dart';
import 'package:flutter_frame/src/presentation/base_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

final GetIt get = GetIt.instance;

typedef Factory<T> = T Function();

abstract class BaseServiceLocator {
  BaseServiceLocator(Router router) {
    registerSingleton(KeyValueStorage());
    registerSingleton(router);
  }

  @protected
  void registerSingleton<T>(T instance) => get.registerSingleton(instance);

  @protected
  void registerLazySingleton<T>(Factory<T> factory) => get.registerLazySingleton(factory);

  @protected
  void registerFactory<T>(Factory<T> factory) => get.registerFactory(factory);

  @protected
  void registerViewModel<T extends BaseViewModel>(Factory<T> factory) => get.registerFactory(factory);
}
