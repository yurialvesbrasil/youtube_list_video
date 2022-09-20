import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:flutter/material.dart';

class TituloSubPagina extends StatelessWidget {
  final CameraModal camera;

  final sizeTween = Tween<double>(begin: 0, end: 200);

  TituloSubPagina({
    @required this.camera,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: sizeTween.evaluate(animation),
      decoration:
          BoxDecoration(color: HexColor(camera.textcolor.toUpperCase())),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 8),
            child: 
            Hero(
              tag:camera.urlimage,
              child: Image.asset(
                camera.urlimage,
                height: 40,
                width: 40,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 8),
            child: Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    camera.descricao,
                    style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
