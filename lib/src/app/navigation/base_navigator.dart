import 'package:fluro/fluro.dart';
import 'package:flutter_frame/src/presentation/base_screen.dart';
import 'package:meta/meta.dart';

abstract class BaseNavigator {
  Router get router => Router.appRouter;

  @protected
  void registerRoute(String route,
      BaseScreen screen, {
        TransitionType transitionType = TransitionType.fadeIn,
      }) =>
      router.define(
        route,
        handler: Handler(handlerFunc: (context, params) => screen),
        transitionType: transitionType,
      );
}
