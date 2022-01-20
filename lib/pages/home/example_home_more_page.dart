import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop_experiment/components/global/header_sub_page.dart';

class ExampleHomeMorePage extends StatelessWidget {
  const ExampleHomeMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSubPage('home', title: 'More Page'),
        const Text('More page')
      ],
    );
  }
}
