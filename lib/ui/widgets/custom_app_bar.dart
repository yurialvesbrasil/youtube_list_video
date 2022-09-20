import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 12, 4, 0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/pg_top.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            child: Image.asset(
              'assets/images/cultura_icone.png',
              alignment: Alignment.center,
            ),
            onTap: () async {
              if (await canLaunch("http://www.portalcultura.com.br/")) {
                await launch("http://www.portalcultura.com.br/");
              }
            },
          ),
        ],
      ),
    );
  }
}
