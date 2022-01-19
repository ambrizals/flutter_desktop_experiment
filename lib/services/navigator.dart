import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get _currentContext {
    return navigatorKey.currentState!.overlay!.context;
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> to(Widget screen) {
    return navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<dynamic> off(Widget screen) {
    return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  Future<dynamic> push(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void showSnackbar(
      {required String message,
      String? title,
      IconData? icon,
      bool dismissable = false}) {
    ScaffoldMessenger.of(_currentContext).showSnackBar(SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(icon, color: Colors.white),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [if (title != null) Text(title), Text(message)],
            ),
            const Spacer(),
            if (dismissable)
              IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => ScaffoldMessenger.of(_currentContext)
                      .removeCurrentSnackBar())
          ],
        ),
        behavior: SnackBarBehavior.floating));
  }
}
