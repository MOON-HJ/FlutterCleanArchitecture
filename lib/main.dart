import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login_flutter/main_page.dart';
import 'package:simple_login_flutter/login_page.dart';

import 'login_page.dart';
import 'state.dart';
import 'property.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => SimpleState(),
      child: MyApp(),
    ));

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
          primarySwatch: tintColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(title: '로그인'),
        initialRoute: ROOT_PAGE,
        routes: {
          ROOT_PAGE: (context) => LoginPage(),
          MAIN_PAGE: (context) => MainPage(),
        });
  }
}
