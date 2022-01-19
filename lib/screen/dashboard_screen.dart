import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/components/global/window_buttons.dart';
import 'package:flutter_desktop_experiment/notifier/dashboard_notifier.dart';
import 'package:flutter_desktop_experiment/pages/chat_page.dart';
import 'package:flutter_desktop_experiment/pages/home_page.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardNotifier _notifier = DashboardNotifier();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardNotifier>(
      create: (_) => _notifier,
      child: Consumer<DashboardNotifier>(
        builder: (context, notifier, _) => NavigationView(
          appBar: NavigationAppBar(
            leading: const FlutterLogo(
              size: 20,
            ),
            title: MoveWindow(
                child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Flutter Desktop Experiment'),
            )),
            actions: MoveWindow(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Spacer(), WindowButtons()],
              ),
            ),
          ),
          pane: NavigationPane(
              selected: notifier.currentIndex,
              displayMode: PaneDisplayMode.auto,
              onChanged: (i) => notifier.setCurrentIndex(i),
              items: [
                PaneItem(
                    icon: const Icon(FluentIcons.home),
                    title: const Text('Home')),
                PaneItem(
                    icon: const Icon(FluentIcons.chat),
                    title: const Text('Chatting')),
              ]),
          content: NavigationBody(
            index: notifier.currentIndex,
            children: const [
              HomePage(),
              ChatPage(),
            ],
          ),
        ),
      ),
    );
  }
}
