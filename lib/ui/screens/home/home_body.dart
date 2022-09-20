import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/camera_list.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:camera_app/ui/widgets/logo_prodepa.dart';
import 'package:camera_app/ui/widgets/social_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
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
          child: Stack(
            children: <Widget>[
               Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: IconButton(
                      alignment: Alignment.bottomRight,
                      icon: Icon(Icons.info_outline, color: Colors.grey[600],),
                        onPressed: () {},
                    ),
              ),
              Positioned(
                left: 0,
                top: CUSTOM_APP_BAR_HEIGHT + 6,
                right: 0,
                child: ClippedContainer(),
              ),
              CamerasList(),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  titleSpacing: 0.0,
                  automaticallyImplyLeading: false, // Tira o voltar padrão
                  title: CustomAppBar(),
                ),
              ),
            ],
          ),
          onHorizontalDragStart: ((c) {
            Navigator.of(context).pushNamed(
              '/sobre',
            );
          }),
          onTap:(() {
             Navigator.of(context).pushNamed(
              '/sobre',
            );
          }),
        ),
      ),
    );
  }
}
