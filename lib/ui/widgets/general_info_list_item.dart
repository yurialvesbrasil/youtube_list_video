import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:camera_app/ui/util/util.dart';
import 'package:camera_app/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralInfoListItem extends StatelessWidget {
  const GeneralInfoListItem(
      {Key key, this.isLast = false, this.isFirst = false, this.middleChild})
      : super(key: key);

  final bool isLast;
  final bool isFirst;
  final Widget middleChild;

  @override
  Widget build(BuildContext context) {
    final double padding = 16.0;
    BorderRadius borderRadius;

    if (isFirst) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      );
    } else {
      if (isLast) {
        borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        );
      } else {
        borderRadius = null;
      }
    }

    final cameraModel = Provider.of<CameraModal>(context);
    return IntrinsicHeight(
        child: GestureDetector(
      onTap: () async {
        if (await Util.isConnectedToInternet()) {
          if (cameraModel.tipo == 4) {
            print("onTap called noticia.");
            Navigator.of(context).pushNamed(
              '/noticia',
              arguments: cameraModel,
            );
          } else if (cameraModel.tipo == 3) {
            print("onTap called rádio.");
            Navigator.of(context).pushNamed(
              '/radio',
              arguments: cameraModel,
            );
          } else if ((cameraModel.tipo == 1) || (cameraModel.tipo == 2)) {
            print("onTap called camera.");
            Navigator.of(context).pushNamed(
              '/preview',
              arguments: cameraModel,
            );
          } else if (cameraModel.tipo == 5) {
            print("onTap called camera.");
            Navigator.of(context).pushNamed(
              '/cultura_tube',
              arguments: cameraModel,
            );
          }
        } else {
          Util.showNoInternetToast();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*SizedBox(width: padding),
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 4.0,
                decoration: BoxDecoration(
                  color: HexColor(cameraModel.textcolor),
                  borderRadius: borderRadius,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: CircleAvatar(
                    backgroundColor: HexColor(cameraModel.textcolor),
                    radius: 8.0,
                  ),
                ),
                alignment: Alignment.topCenter,
              )
            ],
          ),*/
          SizedBox(width: padding),
          Expanded(
            child: WarningCard(
              padding: padding,
              url: cameraModel.url,
              urlimage: cameraModel.urlimage,
              textcolor: cameraModel.textcolor,
              description: cameraModel.descricao,
              middleChild: middleChild,
            ),
          )
        ],
      ),
    ));
  }
}

class WarningCard extends StatelessWidget {
  const WarningCard(
      {Key key,
      @required this.padding,
      @required this.url,
      @required this.urlimage,
      @required this.textcolor,
      @required this.description,
      this.middleChild})
      : super(key: key);

  final String url;
  final String urlimage;
  final String textcolor;
  final String description;
  final double padding;
  final Widget middleChild;

  @override
  Widget build(BuildContext context) {
    final String textcoloritem = "#FFFFFF";
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.only(right: padding + 1, top: padding),
        elevation: 4.0,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: HexColor(textcolor.toUpperCase()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero( 
                      tag:urlimage,
                      child: Image.asset(
                        urlimage,
                        height: 40,
                        width: 40,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 3, 0, 0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          description,
                          style: TextStyle(
                              color: HexColor(textcoloritem.toUpperCase()),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
