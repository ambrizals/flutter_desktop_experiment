import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_desktop_experiment/routes/constant.dart' as routes;
class UnauthenticatedNotifier with ChangeNotifier {
  late NavigatorService _navigatorService;
  late bool isLoading;
  String? username, password, status;

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
    isLoading = true;
    status = 'Sedang Proses Login';
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    if (checkUsername(username!) && checkPassword(password!)) {
      _navigatorService.push('main', routes.authenticated);
    } else {
      print('salah');
    }
    isLoading = false;
    status = null;
    notifyListeners();    
  }
}
