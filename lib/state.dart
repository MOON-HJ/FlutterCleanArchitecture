import 'package:flutter/material.dart';

class SimpleState extends ChangeNotifier {
  String _email;
  String _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  String get email => _email;
  String get password => _password;
}
