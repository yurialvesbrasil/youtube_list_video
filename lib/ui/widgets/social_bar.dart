import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialBar extends StatefulWidget {

  SocialBar();

  @override
  _SocialBarState createState() => _SocialBarState();
}

class _SocialBarState extends State<SocialBar> {
 double _tamanhologo = 30.0;
 double _espacologo = 4.0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(_espacologo),
              child: InkWell(
                child: Image.asset(
                  'assets/icon/twitter.png',
                  width: _tamanhologo,
                  height: _tamanhologo,
                ),
                onTap: () async {
                  if (await canLaunch("https://twitter.com/portalcultura")) {
                    await launch("https://twitter.com/portalcultura");
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_espacologo),
              child: InkWell(
                child: Image.asset(
                  'assets/icon/facebook.png',
                  width: _tamanhologo,
                  height: _tamanhologo,
                ),
                onTap: () async {
                  if (await canLaunch("https://www.facebook.com/portalcultura/")) {
                    await launch("https://www.facebook.com/portalcultura/");
                  }
                },
              ),
            ),
            /*Padding(
              padding: EdgeInsets.all(_espacologo),
              child: InkWell(
                child: Image.asset(
                  'assets/icon/whatsapp.png',
                  width: _tamanhologo,
                  height: _tamanhologo,
                ),
                onTap: () async {
                  if (await canLaunch("http://www.portalcultura.com.br/")) {
                    await launch("http://www.portalcultura.com.br/");
                  }
                },
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(_espacologo),
              child: InkWell(
                child: Image.asset(
                  'assets/icon/instagran.png',
                  width: _tamanhologo,
                  height: _tamanhologo,
                ),
                onTap: () async {
                  if (await canLaunch("https://www.instagram.com/portalcultura")) {
                    await launch("https://www.instagram.com/portalcultura");
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_espacologo),
              child: InkWell(
                child: Image.asset(
                  'assets/icon/youtube.png',
                  width: _tamanhologo,
                  height: _tamanhologo,
                ),
                onTap: () async {
                  if (await canLaunch("https://www.youtube.com/user/canalportalcultura")) {
                    await launch("https://www.youtube.com/user/canalportalcultura");
                  }
                },
              ),
            ),
          ],
        ),
    );

  }
}
