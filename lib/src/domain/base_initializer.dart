import 'package:flutter/widgets.dart';
import 'package:flutter_frame/flutter_frame.dart';

abstract class BaseInitializer {
  final BaseServiceLocator serviceLocator;

  BaseInitializer(this.serviceLocator);

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initApp();
    final app = await provideApp();
    runApp(app);
  }

  Future<Widget> provideApp();

  @mustCallSuper
  Future<void> initApp() async {
    await get<KeyValueStorage>().init();
  }
}
