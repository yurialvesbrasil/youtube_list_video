import 'package:camera_app/ui/util/hex_color.dart';
import 'package:flutter/material.dart';

class ItemPlayList extends StatelessWidget {
  final String titulo;
  final String data;    
  final String url;
  final String link;

  const ItemPlayList({Key key, this.titulo, this.data, this.url, this.link}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _comprimento = 300;
    return new InkWell(
      onTap: () async {
        //chama videos desse canal
      },
      child: Card(
        elevation: 2,
        color: HexColor("#F4DDAB"),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: _comprimento,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Text(
                            titulo,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            //overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        width: _comprimento,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Text(data.substring(0, 25),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black26),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
