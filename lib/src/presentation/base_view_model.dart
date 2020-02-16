import 'package:flutter_frame/src/app/navigation/transition.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  PublishSubject<Transition> transitionSubject = PublishSubject();

  @mustCallSuper
  void onAfterInit() {}

  @mustCallSuper
  void onCleared() {
    transitionSubject.close();
  }

  void navigateTo(String route, {bool clearStack}) {
    transitionSubject.sink.add(Transition(route, clearStack: clearStack));
  }
}
