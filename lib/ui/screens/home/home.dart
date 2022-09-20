import 'package:camera_app/ui/screens/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends  StatelessWidget {

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /*void _enableRotation() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } */

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    return HomeBody();
  }
}
