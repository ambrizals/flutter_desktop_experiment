// ignore_for_file: avoid_print

import 'package:flutter_desktop_experiment/notifier/authentication/unauthenticated_notifier.dart';
import 'package:flutter_desktop_experiment/styles/button_style.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class UnauthenticatedScreen extends StatefulWidget {
  const UnauthenticatedScreen({Key? key}) : super(key: key);

  @override
  State<UnauthenticatedScreen> createState() => _UnauthenticatedScreenState();
}

class _UnauthenticatedScreenState extends State<UnauthenticatedScreen> {
  late GlobalKey<FormState> _formKey;
  final UnauthenticatedNotifier _notifier = UnauthenticatedNotifier();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    DesktopWindow.resetMaxWindowSize().then((value) {
      DesktopWindow.setWindowSize(const Size(1024, 700));
      DesktopWindow.setMinWindowSize(const Size(1024, 700));
    });

    super.initState();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _notifier.doLogin();
    } else {
      print('something happen !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _notifier,
      child: ScaffoldPage(
        content: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(24),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 156,
                ),
                const SizedBox(
                  height: 36,
                ),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ContentDialog(
                      title: const Text('Login'),
                      content: Wrap(
                        runSpacing: 12,
                        children: [
                          TextFormBox(
                            header: 'Username',
                            placeholder: 'Masukkan username anda',
                            onChanged: (value) => _notifier.username = value,
                            validator: (value) {
                              if (value == null) {
                                return 'Username tidak boleh kosong';
                              } else {
                                if (!_notifier.checkUsername(value)) {
                                  return 'Username yang anda masukkan salah';
                                } else if (value.isEmpty) {
                                  return 'Username tidak boleh kosong';
                                }
                              }
                              return null;
                            },
                          ),
                          TextFormBox(
                            header: 'Password',
                            placeholder: 'Masukkan password anda',
                            obscureText: true,
                            onChanged: (value) => _notifier.password = value,
                            validator: (value) {
                              if (value == null) {
                                return 'Password tidak boleh kosong';
                              } else {
                                if (!_notifier.checkPassword(value)) {
                                  return 'Password yang anda masukkan salah !';
                                } else if (value.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                      actions: [
                        Button(
                            style: primaryButtonStyle(),
                            child: const Text('Login'),
                            onPressed: () => submit()),
                        Button(
                            child: const Text('Reset'),
                            onPressed: () {
                              print('siap');
                            }),
                        const Button(
                            child: Text('Lupa Password'), onPressed: null),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
