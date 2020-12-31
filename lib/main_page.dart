import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login_flutter/state.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SimpleState>(
          builder: (context, state, child) {
            return Text('로그인 완료 : ${state.email}');
          },
        ),
      ),
    );
  }
}
