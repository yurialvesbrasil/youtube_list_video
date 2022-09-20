
import 'package:camera_app/core/models/camera.dart';
import 'package:camera_app/core/services/api.dart';


class CamerasService extends API {
  static CamerasService _camerasServiceSingleton;
  

  CamerasService() {
    getAllCameras();
  }

  static CamerasService instance() {
    if (_camerasServiceSingleton == null) {
      _camerasServiceSingleton = CamerasService();
    }

    return _camerasServiceSingleton;
  }

//Buscar cameras do servidor
  Future<List<CameraModal>> getAllCameras() async {
    /* try {
      String baseURL = API.instance().getBaseURL();
      print("AVISO - $baseURL");
      var response = await client.get("$baseURL/cameras",
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return camerasFromJson(utf8.decode(response.bodyBytes));
      } else {
        throw Exception(DEFAULT_ERROR_MESSAGE);
      }
    } catch (exception, _) {
      return null;
    }*/

      return <CameraModal>[
      const CameraModal(urlimage: "assets/icon/tv.png",
                        textcolor: "#84AA3E", 
                        descricao: 'TV AO VIVO', 
                        url: 'rtmp://177.74.1.38:80/funtelpa/tv_funtelpa', 
                        host: "177.74.1.38",
                        tipo: 1),   
      const CameraModal(urlimage: "assets/icon/radio.png",
                        textcolor: "#A53C7E", 
                        descricao: 'ESTÚDIO AO VIVO', 
                        url: 'rtmp://177.74.1.38:80/funtelpa/radio_funtelpa', 
                        host:"177.74.1.38",
                        tipo: 2),
      const CameraModal(urlimage: "assets/icon/radio_som.png",
                        textcolor: "#f58c36", 
                        descricao: 'RÁDIO AO VIVO', 
                        url: 'http://177.74.1.38:1935/funtelpa/mp3:radio_funtelpa_aac/playlist.m3u8', 
                        host:"177.74.1.38",
                        tipo: 3),
      const CameraModal(urlimage: "assets/icon/ico_culturaplay.png",
                        textcolor: "#035A83", 
                        descricao: 'CULTURA PLAY', 
                        url: '', 
                        host:"177.74.1.38",
                        tipo: 5),  
      const CameraModal(urlimage: "assets/icon/ico_noticias.png",
                        textcolor: "#C52222", 
                        descricao: 'NOTÍCIAS', 
                        url: 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p', 
                        host:"177.74.1.38",
                        tipo: 4),              
                                  
    ];
  }

}