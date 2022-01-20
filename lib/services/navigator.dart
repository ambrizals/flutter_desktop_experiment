import 'package:fluent_ui/fluent_ui.dart';

class NavigatorMap {
  final String key;
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorMap(
    this.key,
    this.navigatorKey,
  );
}

class NavigatorService {
  // Map<String, GlobalKey<NavigatorState>>
  final List<NavigatorMap> _navigators =
      List<NavigatorMap>.empty(growable: true);

  NavigatorMap navigator(String key) {
    return _navigators.firstWhere((navigator) => navigator.key == key);
  }

  NavigatorMap addNavigator(String key) {
    final navigatorKey = GlobalKey<NavigatorState>();
    final navigator = NavigatorMap(key, navigatorKey);
    _navigators.add(navigator);
    return navigator;
  }

  // GlobalKey<NavigatorState> navigatorKey  = GlobalKey<NavigatorState>();

  // BuildContext get _currentContext {
  //   return navigatorKey.currentState!.overlay!.context;
  // }

  void back(String origin) {
    return navigator(origin).navigatorKey.currentState!.pop();
  }

  // Future<dynamic> to(Widget screen) {
  //   return navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => screen));
  // }

  // Future<dynamic> off(Widget screen) {
  //   return navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => screen));
  // }

  Future<dynamic> push(String origin, String routeName, {dynamic arguments}) {
    return navigator(origin)
        .navigatorKey
        .currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplace(String origin, String routeName,
      {dynamic arguments}) {
    return navigator(origin)
        .navigatorKey
        .currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  // void showSnackbar(
  //     {required String message,
  //     String? title,
  //     IconData? icon,
  //     bool dismissable = false}) {
  //   ScaffoldMessenger.of(_currentContext).showSnackBar(SnackBar(
  //       content: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           if (icon != null)
  //             Padding(
  //               padding: const EdgeInsets.only(right: 16.0),
  //               child: Icon(icon, color: Colors.white),
  //             ),
  //           Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [if (title != null) Text(title), Text(message)],
  //           ),
  //           const Spacer(),
  //           if (dismissable)
  //             IconButton(
  //                 icon: const Icon(
  //                   Icons.close,
  //                   color: Colors.white,
  //                 ),
  //                 onPressed: () => ScaffoldMessenger.of(_currentContext)
  //                     .removeCurrentSnackBar())
  //         ],
  //       ),
  //       behavior: SnackBarBehavior.floating));
  // }
}
