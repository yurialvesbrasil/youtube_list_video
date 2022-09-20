import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/animation/left_right.dart';
import 'package:camera_app/ui/widgets/camera.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:camera_app/ui/widgets/link_programacao.dart';
import 'package:camera_app/ui/widgets/titulo_subpagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:screen/screen.dart';

class CameraBody extends StatefulWidget {
  final CameraModal camera;
  final IjkMediaController controller;

  CameraBody({
    @required this.camera,
    @required this.controller,
  });

  @override
  _CameraBodyState createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody>
    with SingleTickerProviderStateMixin {
  AnimationController controllerAnimacao;

  //Classe abstrata que vai receber alguma animação
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    
    Screen.keepOn(true);

    controllerAnimacao = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    // Quando o controle variar de 0 ate 1 em dois segundos, o animation vai variar de 0 a 300.
    animation =
        CurvedAnimation(parent: controllerAnimacao, curve: Curves.elasticOut);
    // Inicializa a animação para frente
    controllerAnimacao.forward();
  }

  @override
  void dispose() {
    controllerAnimacao.dispose();
    Screen.keepOn(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
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
          body: Stack(
            children: [
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
                  automaticallyImplyLeading: false, // Tira o voltar padrão
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
                top: MediaQuery.of(context).padding.top +
                    CUSTOM_APP_BAR_HEIGHT +
                    70,
                child: LeftRight(
                  animation: animation,
                  child: TituloSubPagina(
                    camera: widget.camera,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      MediaQuery.of(context).padding.top +
                          CUSTOM_APP_BAR_HEIGHT +
                          105,
                      0,
                      0),
                  child: ListView(
                    children: <Widget>[
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: 
                        HexColor("#F4DDAB"),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 4.0 / 2.5,
                              child: FutureBuilder<Widget>(
                                future: buildIjkPlayer(
                                    context, widget.camera, widget.controller),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                      return Text(
                                          'Pressione o botão para começar.');
                                    case ConnectionState.active:
                                    case ConnectionState.waiting:
                                      return new Center(
                                          child:
                                              new CircularProgressIndicator());
                                    case ConnectionState.done:
                                      if (snapshot.hasError) {
                                        return new Text(
                                          'Erro na tentativa de executar o video. \n ${snapshot.error}',
                                          style: TextStyle(color: Colors.red),
                                        );
                                      } else {
                                        return new Container(
                                            child: snapshot.data);
                                      }
                                  }
                                  return null; // unreachable
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: MediaQuery.of(context).padding.top +
                    CUSTOM_APP_BAR_HEIGHT +
                    360,
                child: (widget.camera.tipo == 1)
                    ? LinkProgramacao(
                        camera: widget.camera,
                        link: "http://www.portalcultura.com.br/node/44806",
                      )
                    : LinkProgramacao(
                        camera: widget.camera,
                        link: "http://www.portalcultura.com.br/node/44807",
                      ),
              ),
            ],
          ),
        ),
      ),
      onHorizontalDragStart: ((c) {
        Navigator.of(context).pop();
      }),
    );
  }
}
