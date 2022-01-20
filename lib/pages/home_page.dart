import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/pages/home/example_home_list_page.dart';
import 'package:flutter_desktop_experiment/pages/home/example_home_more_page.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavigatorMap _navigatorMap =
      locator<NavigatorService>().addNavigator('home');

  @override
  void dispose() {
    locator<NavigatorService>().removeNavigator('home');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Navigator(
        key: _navigatorMap.navigatorKey,
        initialRoute: '/',
        onGenerateRoute: _generateRoute,
      ),
    );
  }
}

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'more':
      return FluentPageRoute(builder: (_) => const ExampleHomeMorePage());

    default:
      return FluentPageRoute(builder: (_) => ExampleHomeListPage());
  }
}
