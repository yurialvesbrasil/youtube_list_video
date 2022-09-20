// To parse this JSON data, do
//
//     final videosPlayLists = videosPlayListsFromJson(jsonString);
//
//     Videos de uma play list

import 'dart:convert';

VideosPlayLists videosPlayListsFromJson(String str) => VideosPlayLists.fromJson(json.decode(str));

String videosPlayListsToJson(VideosPlayLists data) => json.encode(data.toJson());

class VideosPlayLists {
    String kind;
    String etag;
    PageInfo pageInfo;
    List<Item> items;

    VideosPlayLists({
        this.kind,
        this.etag,
        this.pageInfo,
        this.items,
    });

    factory VideosPlayLists.fromJson(Map<String, dynamic> json) => VideosPlayLists(
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String kind;
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
        kind: json["kind"] == null ? null : json["kind"],
        etag: json["etag"] == null ? null : json["etag"],
        id: json["id"] == null ? null : json["id"],
        snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "etag": etag == null ? null : etag,
        "id": id == null ? null : id,
        "snippet": snippet == null ? null : snippet.toJson(),
    };
}

class Snippet {
    DateTime publishedAt;
    String channelId;
    String title;
    String description;
    Thumbnails thumbnails;
    String channelTitle;
    String playlistId;
    int position;
    ResourceId resourceId;

    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.playlistId,
        this.position,
        this.resourceId,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"] == null ? null : json["channelId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"] == null ? null : json["channelTitle"],
        playlistId: json["playlistId"] == null ? null : json["playlistId"],
        position: json["position"] == null ? null : json["position"],
        resourceId: json["resourceId"] == null ? null : ResourceId.fromJson(json["resourceId"]),
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
        "channelId": channelId == null ? null : channelId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
        "channelTitle": channelTitle == null ? null : channelTitle,
        "playlistId": playlistId == null ? null : playlistId,
        "position": position == null ? null : position,
        "resourceId": resourceId == null ? null : resourceId.toJson(),
    };
}

class ResourceId {
    String kind;
    String videoId;

    ResourceId({
        this.kind,
        this.videoId,
    });

    factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"] == null ? null : json["kind"],
        videoId: json["videoId"] == null ? null : json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind == null ? null : kind,
        "videoId": videoId == null ? null : videoId,
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
        thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
        medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
        standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault == null ? null : thumbnailsDefault.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "high": high == null ? null : high.toJson(),
        "standard": standard == null ? null : standard.toJson(),
        "maxres": maxres == null ? null : maxres.toJson(),
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
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
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
        totalResults: json["totalResults"] == null ? null : json["totalResults"],
        resultsPerPage: json["resultsPerPage"] == null ? null : json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults == null ? null : totalResults,
        "resultsPerPage": resultsPerPage == null ? null : resultsPerPage,
    };
}
