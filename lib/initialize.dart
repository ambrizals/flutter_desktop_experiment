import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'notifier/initialize_notifier.dart';

class Initialize extends StatelessWidget {
  final InitializeNotifier _initializeNotifier = InitializeNotifier();

  Initialize({Key? key}) : super(key: key) {
    _initializeNotifier.printSomething();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _initializeNotifier,
      child: ScaffoldPage(
        content: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProgressRing(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Mohon tunggu sebentar',
                  style: TextStyle(fontSize: 16),
                )
              ]),
        ),
      ),
    );
  }
}
