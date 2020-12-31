import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_login_flutter/main.dart';
import 'package:simple_login_flutter/state.dart';

import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin(BuildContext context) {
    final String email = _emailController.text;
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);
    state.setEmail(email);

    Navigator.pushReplacementNamed(context, MAIN_PAGE);
  }

  void _onCancle() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
          title: Text("로그인"),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(height: 12.0),
            SizedBox(height: 24.0),
            buildLoginForm(),
          ]),
        ));
  }

  Widget buildLoginForm() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration:
              InputDecoration(labelText: 'e-mail', focusColor: Colors.black),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'password'),
        ),
        SizedBox(height: 32.0),
        FlatButton(
          minWidth: double.infinity,
          color: Colors.green,
          onPressed: () => _onLogin(context),
          child: Text('Next',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
          padding: EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
