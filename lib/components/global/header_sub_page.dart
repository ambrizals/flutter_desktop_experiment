import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';

class HeaderSubPage extends StatelessWidget {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final String origin;
  final String title;

  HeaderSubPage(this.origin, {required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      color: Colors.grey[20],
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        if (_navigatorService.isPushed(origin))
          IconButton(
              icon: const Icon(FluentIcons.back),
              onPressed: () => _navigatorService.back(origin)),
        const SizedBox(width: 12),
        Text(title)
      ]),
    );
  }
}
