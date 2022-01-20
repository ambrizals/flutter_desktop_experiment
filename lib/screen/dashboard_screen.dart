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
                children: [
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(top: 6, right: 6),
                      child: Button(
                          child: const Icon(FluentIcons.settings),
                          onPressed: () {})),
                  Padding(
                      padding: const EdgeInsets.only(top: 6, right: 6),
                      child: Button(
                          child: const Icon(FluentIcons.action_center),
                          onPressed: () {})),
                  const SizedBox(width: 24),
                  const WindowButtons()
                ],
              ),
            ),
          ),
          pane: NavigationPane(
              header: const Text('Menu'),
              selected: notifier.currentIndex,
              displayMode: PaneDisplayMode.compact,
              onChanged: (i) => notifier.setCurrentIndex(i),
              items: [
                PaneItem(
                    icon: const Icon(FluentIcons.home),
                    title: const Text('Home')),
                PaneItem(
                    icon: const Icon(FluentIcons.chat),
                    title: const Text('Chatting')),
              ],
              footerItems: [
                PaneItem(
                    icon: const Icon(FluentIcons.settings),
                    title: const Text('Settings')),
                PaneItem(
                    icon: const Icon(FluentIcons.action_center),
                    title: const Text('Action Center')),

              ]),
          content: NavigationBody(
            index: notifier.currentIndex,
            children: [
              HomePage(),
              const ChatPage(),
            ],
          ),
        ),
      ),
    );
  }
}
