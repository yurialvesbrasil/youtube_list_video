import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/animation/left_right.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:camera_app/ui/widgets/link_programacao.dart';
import 'package:camera_app/ui/widgets/player_widget.dart';
import 'package:camera_app/ui/widgets/titulo_subpagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RadioScreen extends StatefulWidget {
  final CameraModal camera;

  RadioScreen({
    @required this.camera,
  });

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controllerAnimacao;

  //Classe abstrata que vai receber alguma animação
  Animation<double> animation;

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void initState() {
    super.initState();

    _portraitModeOnly();

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
              children: <Widget>[
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
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, CUSTOM_APP_BAR_HEIGHT + 30, 0, 0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              20, CUSTOM_APP_BAR_HEIGHT + 80, 20, 80),
                          child:
                              Image.asset("assets/images/radio_from_page.png"),
                        )),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top +
                      CUSTOM_APP_BAR_HEIGHT +
                      250,
                  left: 60,
                  child: PlayerWidget(url: widget.camera.url),
                ),
                Positioned(
                    top: MediaQuery.of(context).padding.top +
                        CUSTOM_APP_BAR_HEIGHT +
                        360,
                    left: 0,
                    child: LinkProgramacao(
                      camera: widget.camera,
                      link: "http://www.portalcultura.com.br/node/44807",
                    )),
              ],
            )),
      ),
      onHorizontalDragStart: ((c) {
        Navigator.of(context).pop();
      }),
    );
  }
}
