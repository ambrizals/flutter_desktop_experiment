// import 'package:flutter_desktop_experiment/routes/route.dart';
// import 'package:flutter_desktop_experiment/routes/constant.dart' as route;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_desktop_experiment/initialize.dart';
// import 'package:flutter_desktop_experiment/notifier/initialize_notifier.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';

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
      home: Initialize(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       navigatorKey: locator<NavigatorService>().navigatorKey,
//       onGenerateRoute: generateRoute,
//       initialRoute: route.HOME,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }
