// import 'package:flutter_desktop_experiment/notifier/counter.dart';
// import 'package:flutter_desktop_experiment/screen/Home.dart';
import 'package:flutter_desktop_experiment/screen/not_found_screen.dart';
import 'package:flutter_desktop_experiment/screen/Popup.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'constant.dart' as routes;

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    // case routes.HOME:
    //   return MaterialPageRoute(
    //       builder: (context) => ChangeNotifierProvider<CounterNotifier>(
    //           create: (_) => CounterNotifier(3), child: MyHomeScreen()));

    case routes.popup:
      return MaterialPageRoute(builder: (context) => PopupPage());

    default:
      return MaterialPageRoute(builder: (context) => const NotFoundScreen());
  }
}
