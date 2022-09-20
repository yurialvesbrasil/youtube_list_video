import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/core/models/noticias.dart';
import 'package:camera_app/core/view_model/noticia_view_model.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/animation/item_effect.dart';
import 'package:camera_app/ui/widgets/animation/left_right.dart';
import 'package:camera_app/ui/widgets/animation/list_bloc.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:camera_app/ui/widgets/item_noticia.dart';
import 'package:camera_app/ui/widgets/titulo_subpagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaScreen extends StatefulWidget {
  final CameraModal camera;

  NoticiaScreen({
    @required this.camera,
  });

  @override
  _NoticiaPageState createState() => _NoticiaPageState();
}

class _NoticiaPageState extends State<NoticiaScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controllerAnimacao;

  //Classe abstrata que vai receber alguma animação
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _listBloc = new ListBloc();
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
    _listBloc.dispose();
    super.dispose();
  }

  ListBloc _listBloc;
  var model;
  List<Item> listaNoticias;

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void tabSelected(int index) {}

  @override
  Widget build(BuildContext context) {
    model = Provider.of<NoticiaViewModel>(context);
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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
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
              Positioned(
                top: 190,
                left: 0,
                right: 0,
                child: _getWidgetForViewState(context),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor("#C52222"),
          child: Icon(Icons.refresh),
          onPressed: () => model.getAllNoticias(),
        ),
      ),
    );
  }

  Widget _getWidgetForViewState(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    paddingTop = paddingTop > 20.0 ? paddingTop : 18.0 + paddingTop;

    if (model.state == ViewState.RESPONSE_ERROR || model.noticias == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(DEFAULT_PADDING * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DEFAULT_ERROR_MESSAGE,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: DEFAULT_PADDING,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.refresh),
                label: Text("Tentar novamente"),
                onPressed: () => model.getAllNoticias(),
              )
            ],
          ),
        ),
      );
    } else {
      if (model.state == ViewState.BUSY && model.noticias.rss == null) {
        return Stack(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(DEFAULT_PADDING),
                child: FloatingActionButton(
                  backgroundColor: HexColor("#C52222"),
                  foregroundColor: Colors.black54,
                  child: Icon(Icons.refresh),
                  onPressed: () => model.getAllNoticias(),
                ),
              ),
            )
          ],
        );
      } else {
        listaNoticias = model.noticias.rss.channel.item;
        _listBloc.startAnimation(6, Duration(milliseconds: 300));
        //print(listaNoticias.length);

        return RefreshIndicator(
          onRefresh: () => model.getAllNoticias(),
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: MediaQuery.of(context).size.height - 210,
              child: ListView.builder(
                  itemCount: 6,
                  //shrinkWrap: true,
                  //padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: paddingTop - 20,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < 5) {
                      String _titulo = listaNoticias[index].title.toString();
                      String _data = listaNoticias[index].pubDate.toString();
                      String _creator =
                          listaNoticias[index].dcCreator.toString();
                      String _link = listaNoticias[index].link.toString();
                      //String _descricao = listaNoticias[index].description as String;
                      return ItemEffect(
                          child: ItemNoticia(
                            titulo: _titulo,
                            data: _data,
                            creator: _creator,
                            link: _link,
                          ),
                          duration: Duration(milliseconds: 300),
                          position: index);
                      /*return ;*/
                    } else {
                      return InkWell(
                        onTap: () async {
                          if (await canLaunch(
                              "http://www.portalcultura.com.br/imprensa")) {
                            await launch(
                                "http://www.portalcultura.com.br/imprensa");
                          }
                        },
                        child: Card(
                          elevation: 2,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/pg_top.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                              child: Align(
                                alignment: Alignment.center,
                                child:
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Ler +",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                )
                                ),
                              ),
                            ),

                        ),
                      );
                    }
                  })),
        );
      }
    }
  }
}
