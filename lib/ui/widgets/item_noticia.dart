import 'package:camera_app/ui/util/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemNoticia extends StatefulWidget {
  final String titulo;
  final String data;
  final String descricao;
  final String creator;
  final String link;

  const ItemNoticia(
      {Key key,
      this.titulo,
      this.data,
      this.descricao,
      this.creator,
      this.link})
      : super(key: key);

  @override
  _ItemNoticiaState createState() => _ItemNoticiaState();
}

class _ItemNoticiaState extends State<ItemNoticia> {
  @override
  Widget build(BuildContext context) {
    double _comprimento = 300;
    return new InkWell(
      onTap: () async {
        if (await canLaunch(widget.link)) {
          await launch(widget.link);
        }
      },
      child: Card(
        elevation: 2,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pg_top.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child:
              Padding(
                padding: EdgeInsets.all(8),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: _comprimento,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(
                              widget.titulo,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          width: _comprimento,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Text(widget.data.substring(0, 25),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black26),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        Container(
                          width: _comprimento,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Text("by " + widget.creator,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.black),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        /*Container(
                          width: _comprimento,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text("Ler +",
                                style: TextStyle(color: Colors.red)),
                          )),*/
                      ],
                    ),
                  ],
                )
              )
             ),

      ),
    );
  }
}
