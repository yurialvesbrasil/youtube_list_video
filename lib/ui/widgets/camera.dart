import 'package:camera_app/core/models/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

Future<Widget> buildIjkPlayer(
  BuildContext context, 
  CameraModal camera, 
  IjkMediaController controller ) async {
  
  await controller.setNetworkDataSource(
    camera.url,
    autoPlay: true,
  );

  return Container(
    child: IjkPlayer(
      mediaController: controller,
      statusWidgetBuilder: _buildStatusWidget,     
    ),
  );
}

 Widget _buildStatusWidget(
    BuildContext context,
    IjkMediaController controller,
    IjkStatus status,
  ) {
    if (status == IjkStatus.noDatasource) {
      print("====================================== Erro ====================================");
      return Center(
        child: Text(
          "Erro ao carregar video.",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    // you can custom your self status widget
    return IjkStatusWidget.buildStatusWidget(context, controller, status);
  }