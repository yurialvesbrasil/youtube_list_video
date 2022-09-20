import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/screens/camera/camera_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class CameraScreen extends StatefulWidget {
  final CameraModal camera;

  CameraScreen({
    @required this.camera,
  });

  _CameraScreen createState() => _CameraScreen();
}

class _CameraScreen extends State<CameraScreen> {
  IjkMediaController controller;

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
/*
  void _enableRotation() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }*/

  @override
  void initState() {
    controller = IjkMediaController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return CameraBody(
      camera: widget.camera,
      controller: controller,
    );
  }

}
