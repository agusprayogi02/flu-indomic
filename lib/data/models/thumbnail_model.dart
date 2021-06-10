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
    this.thumb =
        "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png",
    this.type = "",
    this.updatedOn = "",
    this.endpoint = "",
    this.chapter = "",
  });

  final String title;
  final String thumb;
  final String type;
  final String updatedOn;
  final String endpoint;
  final String chapter;

  factory ThumbMangaList.fromJson(Map<String, dynamic> json) => ThumbMangaList(
        title: json["title"],
        thumb: json["thumb"],
        type: json["type"],
        updatedOn: json["updated_on"],
        endpoint: json["endpoint"],
        chapter: json["chapter"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "type": type,
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
