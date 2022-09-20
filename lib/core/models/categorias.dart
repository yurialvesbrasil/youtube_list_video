// To parse this JSON data, do
//
//     final categorias = categoriasFromJson(jsonString);

import 'dart:convert';

Categorias categoriasFromJson(String str) => Categorias.fromJson(json.decode(str));

String categoriasToJson(Categorias data) => json.encode(data.toJson());

class Categorias {
  String kind;
  String etag;
  List<Item> items;

  Categorias({
    this.kind,
    this.etag,
    this.items,
  });

  factory Categorias.fromJson(Map<String, dynamic> json) => Categorias(
    kind: json["kind"],
    etag: json["etag"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Kind kind;
  String etag;
  String id;
  Snippet snippet;

  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]],
    etag: json["etag"],
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
  };
}

enum Kind { YOUTUBE_VIDEO_CATEGORY }

final kindValues = EnumValues({
  "youtube#videoCategory": Kind.YOUTUBE_VIDEO_CATEGORY
});

class Snippet {
  ChannelId channelId;
  String title;
  bool assignable;

  Snippet({
    this.channelId,
    this.title,
    this.assignable,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    channelId: channelIdValues.map[json["channelId"]],
    title: json["title"],
    assignable: json["assignable"],
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelIdValues.reverse[channelId],
    "title": title,
    "assignable": assignable,
  };
}

enum ChannelId { UCBR8_60_B28_HP2_BM_D_PDNTC_Q }

final channelIdValues = EnumValues({
  "UCBR8-60-B28hp2BmDPdntcQ": ChannelId.UCBR8_60_B28_HP2_BM_D_PDNTC_Q
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
