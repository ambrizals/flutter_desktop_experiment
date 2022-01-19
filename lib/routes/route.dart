import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/initialize.dart';
import 'package:flutter_desktop_experiment/notifier/authentication/unauthenticated_notifier.dart';
import 'package:flutter_desktop_experiment/notifier/initialize_notifier.dart';
import 'package:flutter_desktop_experiment/screen/dashboard_screen.dart';
import 'package:flutter_desktop_experiment/screen/unauthenticated_screen.dart';
import 'package:provider/provider.dart';
import 'constant.dart' as routes;
import 'package:flutter_desktop_experiment/screen/not_found_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.initial:
      return FluentPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (context) => InitializeNotifier(), child: Initialize()));
    case routes.unauthenticated:
      return FluentPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => UnauthenticatedNotifier(),
              child: const UnauthenticatedScreen()));
    case routes.authenticated:
      return FluentPageRoute(builder: (_) => DashboardScreen());
    default:
      return FluentPageRoute(builder: (_) => const NotFoundScreen()); 
  }
  // return FluentPageRoute(builder: builder)
}
