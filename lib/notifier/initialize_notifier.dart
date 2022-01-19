import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
import 'package:flutter_desktop_experiment/routes/constant.dart' as routes;
import 'package:flutter/widgets.dart';

class InitializeNotifier with ChangeNotifier {
  late NavigatorService _navigatorService;

  InitializeNotifier() {
    _navigatorService = locator<NavigatorService>();
    checkAuthentication();
  }

  void printSomething() {
    // ignore: avoid_print
    print('printSomething');
  }

  Future<void> checkAuthentication() async {
    // future delay
    await Future.delayed(const Duration(seconds: 5));
    _navigatorService.pushReplace(routes.unauthenticated);
  }
}
