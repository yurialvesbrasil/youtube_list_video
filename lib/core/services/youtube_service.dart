import 'dart:convert';
import 'package:camera_app/core/models/lista.dart';
import 'package:camera_app/core/models/videos_play_lists.dart';
import 'package:camera_app/ui/values/values.dart';
import 'api.dart';

class YouTubeService extends API {
  static YouTubeService _youtubeServiceSingleton;
  String playlistId;

  static YouTubeService instance() {
    if (_youtubeServiceSingleton == null) {
      _youtubeServiceSingleton = YouTubeService();
    }
    return _youtubeServiceSingleton;
  }


  //Busca videos from playlist
  Future<VideosPlayLists> getListVideosFromPlayList(String playlistId) async {
    try {
      String baseURL = API.instance().getVideosPlayListURL(playlistId);
      print("PlayList - $baseURL");
      var response = await client
          .get("$baseURL", headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return videosPlayListsFromJson(utf8.decode(response.bodyBytes));
      } else {
        throw Exception(DEFAULT_ERROR_MESSAGE);
      }
    } catch (exception, _) {
      return null;
    }
  }

  //Busca videos from playlist
  Future<PlayList> getList() async {
    try {
      String baseURL = API.instance().getListURL();
      print("PlayList - $baseURL");
      var response = await client
          .get("$baseURL", headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return playListFromJson(utf8.decode(response.bodyBytes));
      } else {
        throw Exception(DEFAULT_ERROR_MESSAGE);
      }
    } catch (exception, _) {
      return null;
    }
  }
}
