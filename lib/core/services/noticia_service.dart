import 'package:camera_app/core/models/noticias.dart';
import 'package:camera_app/core/services/api.dart';
import 'package:camera_app/ui/values/values.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class NoticiasService extends API {
  static NoticiasService _noticiasServiceSingleton;
 final _targetUrl = 'http://www.portalcultura.com.br/rss.xml';

  NoticiasService() {
    getAllNoticias();
  }

  static NoticiasService instance() {
    if (_noticiasServiceSingleton == null) {
      _noticiasServiceSingleton = NoticiasService();
    }

    return _noticiasServiceSingleton;
  }

  // Transforma XML em Json
  Future<Noticia>  getAllNoticias() async {
    final response =
        await http.get(_targetUrl);

    if (response.statusCode == 200) {
      Xml2Json _myTransformer = Xml2Json();
      _myTransformer.parse(response.body);
      String _stringJson =  _myTransformer.toParker();
     // print(_stringJson);
      Noticia itens =  noticiaFromJson(_stringJson);
      return  itens;
     //return 
    } else {
      // If that response was not OK, throw an error.
      throw Exception(DEFAULT_ERROR_MESSAGE);
    }
  }
    
}