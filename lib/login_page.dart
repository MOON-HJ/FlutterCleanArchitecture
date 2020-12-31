import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_login_flutter/main.dart';
import 'package:simple_login_flutter/property.dart';
import 'package:simple_login_flutter/state.dart';

import 'dart:io';

const CORRECT_EMAIL = 'test@gmail.com';
const CORRECT_PASSWORD = '1234';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _labelErrorMessage = false;
  final TextEditingController _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  void _onLogin(BuildContext context) {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    // validate
    if (email == CORRECT_EMAIL && password == CORRECT_PASSWORD) {
      final SimpleState state =
          Provider.of<SimpleState>(context, listen: false);
      state.setEmail(email);
      Navigator.pushReplacementNamed(context, MAIN_PAGE);
    } else {
      setState(() {
        _labelErrorMessage = true;
        controller.forward(from: 0.0);
      });
    }
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
          margin: EdgeInsets.all(32.0),
          child: Column(children: [
            SizedBox(height: 12.0),
            SizedBox(height: 24.0),
            buildLoginForm(),
          ]),
        ));
  }

  Widget buildLoginForm() {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 12.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(height: 40.0),
        AnimatedBuilder(
            animation: offsetAnimation,
            builder: (buildContext, child) {
              if (offsetAnimation.value < 0.0)
                print('${offsetAnimation.value + 8.0}');
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                padding: EdgeInsets.only(
                    left: offsetAnimation.value + 12.0,
                    right: 12.0 - offsetAnimation.value),
                child: Visibility(
                  child: Text(
                    '아이디 또는 비밀번호를 확인해주세요',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  visible: _labelErrorMessage,
                ),
              );
            }),
        SizedBox(height: 8.0),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: tintColor,
            onPressed: () => _onLogin(context),
            child: Text('Next',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            padding: EdgeInsets.all(16.0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            splashColor: tintColor,
          ),
        )
      ],
    );
  }
}
