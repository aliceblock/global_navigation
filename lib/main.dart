import 'package:flutter/material.dart';

import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // เก็บ NavigatorState ใน navigatorKey ใน NavigationService ของเรา
      navigatorKey: locator<NavigationService>().navigatorKey,
      // กำหนด Route ในการเปลี่ยนหน้าแอป
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'about':
            return MaterialPageRoute(builder: (context) => AboutPage());
          case 'home':
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      initialRoute: 'home', // กำหนดให้เริ่มต้นที่หน้า home
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              child: Text('Go to about'),
              onPressed: () {
                locator<NavigationService>().navigateTo('about');
              },
            )
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'About',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              child: Text('Go to home'),
              onPressed: () {
                locator<NavigationService>().navigateTo('home');
              },
            )
          ],
        ),
      ),
    );
  }
}
