import 'package:flutter/material.dart';

import 'app/presentation/pages/main_page.dart';

// void main() => runApp(MyApp());

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final routeName = settings.name;
        switch (routeName) {
          case '/':
            return MaterialPageRoute(builder: (context) => MainPage());
            break;
          default:
        }
      },
    );
  }
}
