import 'package:camera_app/core/view_model/base_view_model.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:http/http.dart' as http;

class API extends BaseViewModel {

  //static final String listaCategoriasURL = "https://www.googleapis.com/youtube/v3/videoCategories?part=snippet&regionCode=BR&maxResults=1&hl=pt_BR&key=$API_KEY";
  //static final String listVideosURL ="https://www.googleapis.com/youtube/v3/videos?part=snippet&key=$API_KEY";
  static final String videosPlayListURL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&key=$API_KEY";
  static final String listURL = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&maxResults=50&key=$API_KEY";

  final client = http.Client();
  static API _instance;

  static API instance() {
    if (_instance == null) _instance = API();
    return _instance;
  }

  /*String getListaCategoriasURL() {
    return API.listaCategoriasURL;
  }*/

  //String getListVideosURL(String videoCategoryId) {
  //  return API.listVideosURL + "&videoCategoryId=$videoCategoryId";
 // }

  String getVideosPlayListURL(String playlistId) {
    return API.videosPlayListURL + "&playlistId=$playlistId";
  }

  String getListURL() {
    return API.listURL + "&channelId=UCAzxf2ItqtUKyFyNPAmP7eg";
  }


}
