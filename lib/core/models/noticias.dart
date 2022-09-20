// To parse this JSON data, do
//
//     final noticia = noticiaFromJson(jsonString);

import 'dart:convert';

Noticia noticiaFromJson(String str) => Noticia.fromJson(json.decode(str));

String noticiaToJson(Noticia data) => json.encode(data.toJson());

class Noticia {
    Rss rss;

    Noticia({
        this.rss,
    });

    factory Noticia.fromJson(Map<String, dynamic> json) => new Noticia(
        rss: json["rss"] == null ? null : Rss.fromJson(json["rss"]),
    );

    Map<String, dynamic> toJson() => {
        "rss": rss == null ? null : rss.toJson(),
    };
}

class Rss {
    Channel channel;

    Rss({
        this.channel,
    });

    factory Rss.fromJson(Map<String, dynamic> json) => new Rss(
        channel: json["channel"] == null ? null : Channel.fromJson(json["channel"]),
    );

    Map<String, dynamic> toJson() => {
        "channel": channel == null ? null : channel.toJson(),
    };
}

class Channel {
    String title;
    String link;
    String description;
    String language;
    List<Item> item;

    Channel({
        this.title,
        this.link,
        this.description,
        this.language,
        this.item,
    });

    factory Channel.fromJson(Map<String, dynamic> json) => new Channel(
        title: json["title"] == null ? null : json["title"],
        link: json["link"] == null ? null : json["link"],
        description: json["description"] == null ? null : json["description"],
        language: json["language"] == null ? null : json["language"],
        item: json["item"] == null ? null : new List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "link": link == null ? null : link,
        "description": description == null ? null : description,
        "language": language == null ? null : language,
        "item": item == null ? null : new List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Item {
    String title;
    String link;
    dynamic description;
    String pubDate;
    String dcCreator;
    String guid;

    Item({
        this.title,
        this.link,
        this.description,
        this.pubDate,
        this.dcCreator,
        this.guid,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        title: json["title"] == null ? null : json["title"],
        link: json["link"] == null ? null : json["link"],
        description: json["description"],
        pubDate: json["pubDate"] == null ? null : json["pubDate"],
        dcCreator: json["dc:creator"] == null ? null : json["dc:creator"],
        guid: json["guid"] == null ? null : json["guid"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "link": link == null ? null : link,
        "description": description,
        "pubDate": pubDate == null ? null : pubDate,
        "dc:creator": dcCreator == null ? null : dcCreator,
        "guid": guid == null ? null : guid,
    };
}
