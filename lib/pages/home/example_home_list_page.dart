import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';

class ExampleHomeListPage extends StatelessWidget {
  final NavigatorService _navigatorService = locator<NavigatorService>();

  ExampleHomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(32),
          color: Colors.grey[30],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Welcome Home', style: TextStyle(fontSize: 24)),
              Text('This is supposed to be subtitle')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Featured Items',
                style: TextStyle(fontSize: 20),
              ),
              Button(
                  child: const Text('Read More'),
                  onPressed: () => _navigatorService.push('home', 'more'))
            ],
          ),
        )
      ],
    );
  }
}
