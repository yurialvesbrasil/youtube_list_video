import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LogoProdepa extends StatefulWidget {

  LogoProdepa();

  @override
  _LogoProdepaState createState() => _LogoProdepaState();
}

class _LogoProdepaState extends State<LogoProdepa> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset(
        "assets/images/logo_prodepa.png",
        height: 50,
      ),
      onTap: () async {
        if (await canLaunch("http://prodepa.pa.gov.br/")) {
          await launch("http://prodepa.pa.gov.br/");
        }
      },
    );
  }
}
