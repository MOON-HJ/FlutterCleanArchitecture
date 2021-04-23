import 'package:flutter/material.dart';

import '../injection_container.dart' as di;
import '../main.dart';
import '_env.dart';

enum BuildType { dev, prod }

class Environment {
  static Environment _instance;
  static Environment get instance => _instance;
  final BuildType _buildType;
  static BuildType get buildType => instance._buildType;

  static String get baseUrl =>
      instance._buildType == BuildType.dev ? API_URL_DEV : API_URL_PROD;
  const Environment._internal(this._buildType);

  factory Environment.newInstance(BuildType buildType) {
    assert(buildType != null);
    if (_instance == null) {
      _instance = Environment._internal(buildType);
    }
    return _instance;
  }

  static String get buildMode => currentBuildMode();

  bool get isDebuggable => _buildType == BuildType.dev;

  void run() {
    di.init();
    runApp(MyApp());
  }
}

String currentBuildMode() {
  if (const bool.fromEnvironment('dart.vm.product')) {
    return "RELEASE";
  }
  var result = "PROFILE";
  assert(() {
    result = "DEBUG";
    return true;
  }());
  return result;
}
