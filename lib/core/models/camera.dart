import 'dart:convert';

List<CameraModal> camerasFromJson(String str) =>
    new List<CameraModal>.from(json.decode(str).map((x) => CameraModal.fromJson(x)));

String camerasToJson(List<CameraModal> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class CameraModal {
  final String titulo;
  final String descricao;
  final String url;
  final String urlimage;
  final String textcolor;
  final String host;
  final int tipo; // 1 = video / 2 = radio / 3 = noticias

  const CameraModal({this.titulo,this.descricao, this.url, this.urlimage, this.textcolor, this.host, this.tipo});

  factory CameraModal.fromJson(Map<String, dynamic> json) => new CameraModal(
      titulo: json["titulo"] == null ? null : json["titulo"],
      descricao: json["descricao"] == null ? null : json["descricao"],
      url: json["url"] == null ? null : json["url"],
      urlimage: json["url_image"] == null ? null : json["url_image"],
      textcolor: json["text_color"] == null ? null : json["text_color"],
      host: json["host"] == null ? null : json["host"],
      tipo: json["tipo"] == null ? null : json["tipo"],
  );

  Map<String, dynamic> toJson() => {
      "titulo": titulo == null ? null : titulo,
      "descricao": descricao == null ? null : descricao,
      "url": url == null ? null : url,
      "url_image": urlimage == null ? null : urlimage,
      "text_color": textcolor == null ? null : textcolor,
      "host": host == null ? null : host,
      "tipo": tipo == null ? null : tipo,
  };
}