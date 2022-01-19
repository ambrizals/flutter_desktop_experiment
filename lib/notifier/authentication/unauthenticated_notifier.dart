import 'package:flutter_desktop_experiment/screen/dashboard_screen.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
import 'package:flutter/foundation.dart';

class UnauthenticatedNotifier with ChangeNotifier {
  late NavigatorService _navigatorService;
  late bool isLoading;
  String? username, password;

  UnauthenticatedNotifier() {
    _navigatorService = locator<NavigatorService>();
    isLoading = false;
  }

  bool checkPassword(String password) {
    if (password == 'password') {
      return true;
    } else {
      return false;
    }
  }

  bool checkUsername(String username) {
    if (username == 'admin') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> doLogin() async {
    if (checkUsername(username!) && checkPassword(password!)) {
      _navigatorService.off(DashboardScreen());
    }
  }
}
