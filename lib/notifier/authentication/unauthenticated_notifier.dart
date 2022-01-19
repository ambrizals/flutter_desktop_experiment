import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_desktop_experiment/routes/constant.dart' as routes;
import 'package:socket_io_client/socket_io_client.dart';
class UnauthenticatedNotifier with ChangeNotifier {
  late NavigatorService _navigatorService;
  late bool isLoading;
  String? username, password;

  UnauthenticatedNotifier() {
    Socket socket = io(
        'http://localhost:3333',
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    socket.onConnect((_) {
      print('connect');
      socket.emit('notification', {'test': 'test'});
    });
    socket.on('news', (data) => print(data));

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
      _navigatorService.push(routes.authenticated);
    }
  }
}
