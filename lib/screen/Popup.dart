import 'package:flutter_desktop_experiment/services/locator.dart';
import 'package:flutter_desktop_experiment/services/navigator.dart';
import 'package:flutter/material.dart';

class PopupPage extends StatefulWidget {
  @override
  _PopupPageState createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Tekan'),
              onPressed: () => _navigatorService.showSnackbar(
                  message: 'Mantap Pak EKo',
                  title: 'judul',
                  icon: Icons.notifications,
                  dismissable: true),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text('Tekan'),
              onPressed: () => _navigatorService.showSnackbar(
                message: 'Mantap Pak EKo',
                title: 'judul',
              ),
            )
          ],
        ),
      ),
    );
  }
}
