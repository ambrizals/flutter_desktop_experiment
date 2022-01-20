import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/screen/not_found_screen.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';

class HomePage extends StatelessWidget {
  final NavigatorMap _navigatorMap =
      locator<NavigatorService>().addNavigator('home');
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorMap.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: _generateRoute,
    );
  }
}

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return FluentPageRoute(builder: (_) => const NotFoundScreen());
  }
}
