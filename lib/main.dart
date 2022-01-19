import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_desktop_experiment/routes/route.dart';
import 'package:flutter_desktop_experiment/routes/constant.dart' as routes;
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  doWhenWindowReady(() {
    var initializeSize = const Size(500, 500);
    appWindow.minSize = initializeSize;
    appWindow.size = initializeSize;
    appWindow.alignment = Alignment.center;
  });
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      navigatorKey: locator<NavigatorService>().navigatorKey,
      initialRoute: routes.initial,
      onGenerateRoute: generateRoute,
    );
  }
}
