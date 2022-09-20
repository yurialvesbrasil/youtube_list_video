import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/core/view_model/youtube_view_model.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:camera_app/ui/values/colors.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:camera_app/ui/widgets/animation/left_right.dart';
import 'package:camera_app/ui/widgets/clipped_container.dart';
import 'package:camera_app/ui/widgets/custom_app_bar.dart';
import 'package:camera_app/ui/widgets/tab_play_list.dart';
import 'package:camera_app/ui/widgets/titulo_subpagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:provider/provider.dart';

class CulturaTubePage extends StatefulWidget {
  final CameraModal camera;

  const CulturaTubePage({Key key, this.camera}) : super(key: key);

  @override
  _CulturaTubePageState createState() => _CulturaTubePageState();
}

class _CulturaTubePageState extends State<CulturaTubePage>
    with SingleTickerProviderStateMixin {
  AnimationController controllerAnimacao;
  Animation<double> animation;
  YoutubePlayerController _controllerAtivo;

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /*void _enableRotation() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } */

  @override
  void initState() {
    super.initState();

    Screen.keepOn(true);

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

    _controllerAtivo = YoutubePlayerController();
  }

  @override
  void dispose() {
    controllerAnimacao.dispose();
    _controllerAtivo.dispose();
    Screen.keepOn(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    paddingTop = paddingTop > 20.0 ? paddingTop : 18.0 + paddingTop;

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
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                  onPressed: () {
                    final youtubeViewModel =
                        Provider.of<YouTubeViewModel>(context);
                    youtubeViewModel.zeraPlay();
                    Navigator.of(context).pop();
                  },
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
              buildPlayLists(context, _controllerAtivo),
              buildVideosList(context, _controllerAtivo),
            ]),
          ),
        ),
      ),
      onHorizontalDragStart: ((c) {
        Navigator.of(context).pop();
      }),
    );
  }
}

Widget buildVideosList(
    BuildContext context, YoutubePlayerController _controllerAtivo) {
  double paddingTop = MediaQuery.of(context).padding.top;
  paddingTop = paddingTop > 20.0 ? paddingTop : 18.0 + paddingTop;
  final youtubeViewModel = Provider.of<YouTubeViewModel>(context);

  if (youtubeViewModel.state == ViewState.RESPONSE_ERROR ||
      youtubeViewModel.videosPlayList == null) {
    return Positioned(
        top: CUSTOM_APP_BAR_HEIGHT + 200,
        left: 6,
        right: 6,
        bottom: 0,
        child: Center(
          child: Text("Não foi possível carregar a play list."),
        ));
  }
  if (youtubeViewModel.state == ViewState.BUSY &&
      youtubeViewModel.videosPlayList.items.length <= 0) {
    return Stack(
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Positioned(
          top: paddingTop,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(DEFAULT_PADDING),
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black54,
              child: Icon(Icons.refresh),
              onPressed: () => youtubeViewModel.getListaVideosFromPlayList(),
            ),
          ),
        )
      ],
    );
  } else
    return Positioned(
        top: paddingTop + CUSTOM_APP_BAR_HEIGHT + 170,
        left: 6,
        right: 6,
        bottom: 0,
        child: Center(
            child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemCount: youtubeViewModel.videosPlayList.items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            print(youtubeViewModel
                .videosPlayList.items[index].snippet.resourceId.videoId
                .toString());
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/pg_top.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: (youtubeViewModel.state == ViewState.BUSY)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                              Container(
                                height: 244,
                                width: 320,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ])
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                              (youtubeViewModel.isPlay[index])
                                  ? YoutubePlayer(
                                      context: context,
                                      videoId: youtubeViewModel
                                          .videosPlayList
                                          .items[index]
                                          .snippet
                                          .resourceId
                                          .videoId,
                                      flags: YoutubePlayerFlags(
                                        mute: false,
                                        autoPlay: true,
                                        forceHideAnnotation: true,
                                        showVideoProgressIndicator: true,
                                        hideFullScreenButton: true,
                                      ),
                                      videoProgressIndicatorColor: Colors.amber,
                                      progressColors: ProgressColors(
                                        playedColor: Colors.amber,
                                        handleColor: Colors.amberAccent,
                                      ),
                                      onPlayerInitialized: (controller) {
                                        _controllerAtivo = controller;
                                      },
                                    )
                                  : Container(
                                      height: 180,
                                      width: 320,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: (youtubeViewModel
                                              .videosPlayList
                                              .items[index]
                                              .snippet
                                              .thumbnails !=
                                              null)
                                              ? NetworkImage( youtubeViewModel
                                                  .videosPlayList
                                                  .items[index]
                                                  .snippet
                                                  .thumbnails
                                                  .medium
                                                  .url)
                                              : AssetImage("assets/images/private.png"),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      child: IconButton(
                                        iconSize: 60,
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {
                                          youtubeViewModel.setPlay(index);
                                        },
                                      ),
                                      /* add child content here */
                                    ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                            youtubeViewModel.videosPlayList
                                                .items[index].snippet.title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.fullscreen),
                                        onPressed: (() async {
                                          if (await canLaunch(
                                              "http://www.youtube.com/watch?v=" +
                                                  youtubeViewModel
                                                      .videosPlayList
                                                      .items[index]
                                                      .snippet
                                                      .resourceId
                                                      .videoId)) {
                                            await launch(
                                                "http://www.youtube.com/watch?v=" +
                                                    youtubeViewModel
                                                        .videosPlayList
                                                        .items[index]
                                                        .snippet
                                                        .resourceId
                                                        .videoId);
                                          }
                                        }),
                                      ),
                                    ],
                                  ))
                            ]),
                ),
                onTap: (() {
                  /**/
                }),
              ),
            );
          },
        )));
}

Widget buildPlayLists(
    BuildContext context, YoutubePlayerController _controllerAtivo) {
  double paddingTop = MediaQuery.of(context).padding.top;
  paddingTop = paddingTop > 20.0 ? paddingTop : 18.0 + paddingTop;
  final youtubeViewModel = Provider.of<YouTubeViewModel>(context);
  //youtubeViewModel.getPlayLists();

  if ((youtubeViewModel.playList == null) ||
      (youtubeViewModel.playList.items.length == 0)) {
    return Positioned(
        top: CUSTOM_APP_BAR_HEIGHT + 200,
        left: 6,
        right: 6,
        bottom: 0,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  } else {
    return Positioned(
      top: paddingTop + CUSTOM_APP_BAR_HEIGHT + 115,
      left: 0,
      right: 0,
      child: TabPlayLists(
        playLists: youtubeViewModel.playList,
        tabSelected: ((int) {
          _controllerAtivo.pause();
          youtubeViewModel.zeraPlay();
          //youtubeViewModel.isPlay.clear();

          youtubeViewModel.setPlaylistID(
              youtubeViewModel.playList.items[int].id, int);
          print("PlayList selecionada: " +
              youtubeViewModel.playList.items[int].id);
        }),
      ),
    );
  }
}
