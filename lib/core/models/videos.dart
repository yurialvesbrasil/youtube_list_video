// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

Videos videosFromJson(String str) => Videos.fromJson(json.decode(str));

String videosToJson(Videos data) => json.encode(data.toJson());

class Videos {
  String kind;
  String etag;
  String nextPageToken;
  PageInfo pageInfo;
  List<Item> items;

  Videos({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.pageInfo,
    this.items,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "pageInfo": pageInfo.toJson(),
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

enum Kind { YOUTUBE_VIDEO }

final kindValues = EnumValues({
  "youtube#video": Kind.YOUTUBE_VIDEO
});

class Snippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  List<String> tags;
  String categoryId;
  LiveBroadcastContent liveBroadcastContent;
  Localized localized;
  String defaultAudioLanguage;
  String defaultLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
    this.defaultAudioLanguage,
    this.defaultLanguage,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    categoryId: json["categoryId"],
    liveBroadcastContent: liveBroadcastContentValues.map[json["liveBroadcastContent"]],
    localized: Localized.fromJson(json["localized"]),
    defaultAudioLanguage: json["defaultAudioLanguage"] == null ? null : json["defaultAudioLanguage"],
    defaultLanguage: json["defaultLanguage"] == null ? null : json["defaultLanguage"],
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "categoryId": categoryId,
    "liveBroadcastContent": liveBroadcastContentValues.reverse[liveBroadcastContent],
    "localized": localized.toJson(),
    "defaultAudioLanguage": defaultAudioLanguage == null ? null : defaultAudioLanguage,
    "defaultLanguage": defaultLanguage == null ? null : defaultLanguage,
  };
}

enum LiveBroadcastContent { NONE }

final liveBroadcastContentValues = EnumValues({
  "none": LiveBroadcastContent.NONE
});

class Localized {
  String title;
  String description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
    standard: Default.fromJson(json["standard"]),
    maxres: Default.fromJson(json["maxres"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
    "standard": standard.toJson(),
    "maxres": maxres.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}

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
