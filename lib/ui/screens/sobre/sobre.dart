import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/logo_prodepa.dart';
import '../../widgets/social_bar.dart';

class SobreScreen extends StatefulWidget {
  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    paddingTop = paddingTop > 20.0 ? paddingTop : 18.0 + paddingTop;

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
            child: Stack(children: <Widget>[
              Positioned(
                left: 0,
                top: CUSTOM_APP_BAR_HEIGHT + 6,
                right: 0,
                child: ClippedContainer(),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  titleSpacing: 0.0,
                  automaticallyImplyLeading: false,
                  // Tira o voltar padrão
                  title: CustomAppBar(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 6.0,
                left: 0,
                child: new IconButton(
                  color: Colors.transparent,
                  icon: new Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                left: 8,
                top: CUSTOM_APP_BAR_HEIGHT + 50,
                right: 8,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sobre',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Text(
                            "\nEt sociosqu tristique sollicitudin duis vulputate vehicula class conubia," +
                                "erat netus dui at massa elementum fusce blandit, aenean tincidunt himenaeos " +
                                "ipsum aenean tincidunt orci. felis fames sagittis senectus semper felis " +
                                "pretium dui, purus morbi nunc adipiscing iaculis blandit. suspendisse in " +
                                "elementum ac sem eleifend massa tempor cursus ornare pellentesque curabitur, " +
                                "malesuada aenean diam donec urna ornare porta nibh praesent. libero mauris " +
                                "purus quis hendrerit habitant lorem platea consectetur, fermentum sed conubia " +
                                "consectetur mi cubilia sodales, luctus taciti molestie porttitor odio pretium " +
                                "euismod. elementum malesuada donec eleifend eu dictum nunc amet lorem quisque, " +
                                "primis suspendisse hac maecenas feugiat neque ultrices velit, risus euismod " +
                                "himenaeos tristique est diam lacus phasellus. ",
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SocialBar(),
                    ),
                    LogoProdepa(),
                  ],
                ),
              ),
            ]),
            onHorizontalDragEnd: ((c) {
              Navigator.of(context).pop();
              print("Voltar");
            })),
      ),
    );
  }
}
