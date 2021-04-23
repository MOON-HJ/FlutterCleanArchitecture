import 'package:flutter/material.dart';
import 'package:simple_login_flutter/env/env.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text("hello World"), Text(Environment.baseUrl + "")],
      ),
    );
  }
}
