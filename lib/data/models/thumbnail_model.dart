// To parse this JSON data, do
//
//     final thumbnailModel = thumbnailModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ThumbnailModel thumbnailModelFromJson(String str) =>
    ThumbnailModel.fromJson(json.decode(str));

String thumbnailModelToJson(ThumbnailModel data) => json.encode(data.toJson());

class ThumbnailModel extends Equatable {
  ThumbnailModel({
    this.status = false,
    this.message = "",
    this.mangaList,
  });

  final bool status;
  final String message;
  final List<ThumbMangaList>? mangaList;

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) => ThumbnailModel(
        status: json["status"],
        message: json["message"],
        mangaList: List<ThumbMangaList>.from(
            json["manga_list"].map((x) => ThumbMangaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "manga_list": List<dynamic>.from(mangaList!.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, mangaList];
}

// alias nama untuk manga list
class ThumbMangaList extends Equatable {
  ThumbMangaList({
    this.title = "",
    this.thumb = "",
    this.type = Type.MANGA,
    this.updatedOn = "",
    this.endpoint = "",
    this.chapter = "",
  });

  final String title;
  final String thumb;
  final Type type;
  final String updatedOn;
  final String endpoint;
  final String chapter;

  factory ThumbMangaList.fromJson(Map<String, dynamic> json) => ThumbMangaList(
        title: json["title"],
        thumb: json["thumb"],
        type: typeValues.map[json["type"]] ?? Type.MANGA,
        updatedOn: json["updated_on"],
        endpoint: json["endpoint"],
        chapter: json["chapter"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "type": typeValues.reverse[type],
        "updated_on": updatedOn,
        "endpoint": endpoint,
        "chapter": chapter,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        thumb,
        type,
        updatedOn,
        endpoint,
        chapter,
      ];
}

enum Type { MANGA, MANHUA, MANHWA }

final typeValues = EnumValues(
    {"Manga": Type.MANGA, "Manhua": Type.MANHUA, "Manhwa": Type.MANHWA});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = Map();

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
