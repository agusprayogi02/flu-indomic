// To parse this JSON data, do
//
//     final recommendedModel = recommendedModelFromJson(jsonString);

import 'dart:convert';

RecommendedModel recommendedModelFromJson(String str) =>
    RecommendedModel.fromJson(json.decode(str));

String recommendedModelToJson(RecommendedModel data) =>
    json.encode(data.toJson());

class RecommendedModel {
  RecommendedModel({
    this.status = false,
    this.message = "",
    this.mangaList,
  });

  bool status;
  String message;
  List<MangaList>? mangaList;

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      RecommendedModel(
        status: json["status"],
        message: json["message"],
        mangaList: List<MangaList>.from(
            json["manga_list"].map((x) => MangaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "manga_list": List<MangaList>.from(mangaList!.map((x) => x.toJson())),
      };
}

class MangaList {
  MangaList({
    this.title = "",
    this.thumb = "",
    this.endpoint = "",
  });

  String title;
  String thumb;
  String endpoint;

  factory MangaList.fromJson(Map<String, dynamic> json) => MangaList(
        title: json["title"],
        thumb: json["thumb"],
        endpoint: json["endpoint"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "endpoint": endpoint,
      };
}
