import 'dart:async';
import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/lista.dart';
import 'package:camera_app/core/models/videos_play_lists.dart';
import 'package:camera_app/core/services/youtube_service.dart';
import 'package:camera_app/core/view_model/base_view_model.dart';
import 'package:camera_app/ui/util/util.dart';
import 'package:camera_app/ui/values/values.dart';

class YouTubeViewModel extends BaseViewModel {
  //PlayList
  StreamController<PlayList> _streamControllerPlayList =
      StreamController<PlayList>();
  Stream<PlayList> get playListStream =>
      _streamControllerPlayList.stream.asBroadcastStream();
  PlayList _playList;
  PlayList get playList => _playList;

  //Videos de playlist
  StreamController<VideosPlayLists> _streamControllerPlayListVideos =
      StreamController<VideosPlayLists>();
  Stream<VideosPlayLists> get videosPlayListStream =>
      _streamControllerPlayListVideos.stream.asBroadcastStream();
  VideosPlayLists _videosPlayList;
  VideosPlayLists get videosPlayList => _videosPlayList;

  //PlayList Selecionada
  String _playlistId;
  String get playlistId => _playlistId;

  //PlayList Selecionada
  int _tabId;
  int get tabId => _tabId;

  List<bool> _isPlay;
  List<bool> get isPlay => _isPlay;

  YouTubeViewModel() {
    getPlayLists();
  }

  @override
  void dispose() {
    _streamControllerPlayListVideos.close();
    _isPlay.clear();
    super.dispose();
  }

  void zeraPlay(){
    if(_isPlay != null){
      for(var i =0; i< _isPlay.length; i++){
        _isPlay[i] = false;
      }
      notifyListeners();
    }
  }

  void creatList(int tamanho){
     _isPlay = List<bool>();
    for(var i = 0; i < tamanho; i++){
      _isPlay.add(false);
    }
  }

  void setPlay(int i){
    zeraPlay();
    _isPlay[i] = true;
    notifyListeners();
  }


  

  Future<void> setPlaylistID(String _playlistId, int _tabId) async {
    this._playlistId = _playlistId;
    this._tabId = _tabId;
    print("PlayList foi setada: " + this._playlistId);
    await getListaVideosFromPlayList();
  }

  Future<void> getListaVideosFromPlayList() async {
    setState(ViewState.BUSY);
    try {
      if (await Util.isConnectedToInternet()) {
        _videosPlayList = await YouTubeService.instance()
            .getListVideosFromPlayList(this._playlistId);
        if (_videosPlayList == null) throw new Exception(DEFAULT_ERROR_MESSAGE);
        _streamControllerPlayListVideos.add(_videosPlayList);
        creatList(_videosPlayList.items.length);
        setState(ViewState.IDLE);
      } else {
        Util.showNoInternetToast();
      }
    } on Exception catch (e) {
      setState(ViewState.RESPONSE_ERROR);
      print(e.toString());
      //Util.showErrorToast();
    }
  }

  Future<void> getPlayLists() async {
   setState(ViewState.BUSY);
    try {
      if (await Util.isConnectedToInternet()) {
        _playList = await YouTubeService.instance().getList();
        if (_playList == null) throw new Exception(DEFAULT_ERROR_MESSAGE);
        _streamControllerPlayList.add(_playList);   
        setPlaylistID(_playList.items[0].id, 0);
        setState(ViewState.IDLE);
      } else {
        Util.showNoInternetToast();
      }
    } on Exception catch (e) {
      setState(ViewState.RESPONSE_ERROR);
      print(e.toString());
      //Util.showErrorToast();
    }
  }

  void setTabId(index) {
    this._tabId = index;
    notifyListeners();
  }

}
