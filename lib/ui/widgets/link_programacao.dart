import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkProgramacao extends StatelessWidget {
  final CameraModal camera;
  final String link;

  LinkProgramacao({
    @required this.camera,
    @required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 2,
        color: HexColor("#F4DDAB"),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8, 2, 4, 4),
              child: Image.asset(
                "assets/icon/ic_programacao.png",
                height: 35,
                width: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(48, 0, 1, 1),
              child: Container(
                height: 33,
                width: 150,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "PROGRAMAÇÃO",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () async {
        if (await canLaunch(link)) {
          await launch(link);
        }
      },
    );
  }
}
