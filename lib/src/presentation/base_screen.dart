import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_frame/src/app/navigation/transition.dart';
import 'package:flutter_frame/src/domain/base_service_locator.dart';
import 'package:flutter_frame/src/presentation/base_view_model.dart';

abstract class BaseScreen extends StatefulWidget {}

abstract class BaseScreenState<VM extends BaseViewModel> extends State<BaseScreen> {
  final GlobalKey scaffoldKey = GlobalKey();
  final VM viewModel = get();
  final Router router = get();

  @mustCallSuper
  void init() {}

  @mustCallSuper
  void clear() {}

  @override
  void initState() {
    super.initState();
    viewModel.transitionSubject.stream.listen(_openScreen);
    init();
    viewModel.onAfterInit();
  }

  @override
  void dispose() {
    viewModel.onCleared();
    clear();
    super.dispose();
  }

  void clearFocus() => FocusScope.of(context).requestFocus(FocusNode());

  void closeScreen() => Navigator.of(context).pop();

  void _openScreen(Transition transition) {
    if (transition.route == ModalRoute.of(context).settings.name) return;

    router.navigateTo(
      context,
      transition.route,
      clearStack: transition.clearStack != null && transition.clearStack,
    );
  }
}
