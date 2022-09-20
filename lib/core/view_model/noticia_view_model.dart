import 'dart:async';
import 'package:camera_app/core/enum/enums.dart';
import 'package:camera_app/core/models/noticias.dart';
import 'package:camera_app/core/services/noticia_service.dart';
import 'package:camera_app/core/view_model/base_view_model.dart';
import 'package:camera_app/ui/util/util.dart';
import 'package:camera_app/ui/values/values.dart';

class NoticiaViewModel extends BaseViewModel {
  StreamController<Noticia> _streamController = StreamController<Noticia>();
  Stream<Noticia> get noticiasStream => _streamController.stream.asBroadcastStream();
  Noticia _noticias ;
  Noticia get noticias => _noticias;
  
  NoticiaViewModel(){
    getAllNoticias();
  }
  
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> getAllNoticias() async {
    setState(ViewState.BUSY);
    try {
      if (await Util.isConnectedToInternet()) {
        _noticias = await NoticiasService.instance().getAllNoticias();
        if (_noticias == null) throw new Exception(DEFAULT_ERROR_MESSAGE);
        _streamController.add(_noticias);
        setState(ViewState.IDLE);
      } else {
        Util.showNoInternetToast();
      }
    } on Exception catch (e) {
      print(e.toString());
      setState(ViewState.RESPONSE_ERROR);
      Util.showErrorToast();
    }
  }


}