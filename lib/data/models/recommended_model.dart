// To parse this JSON data, do
//
//     final recommendedModel = recommendedModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

RecommendedModel recommendedModelFromJson(String str) =>
    RecommendedModel.fromJson(json.decode(str));

String recommendedModelToJson(RecommendedModel data) =>
    json.encode(data.toJson());

class RecommendedModel extends Equatable {
  RecommendedModel({
    this.status = false,
    this.message = "",
    this.mangaList,
  });

  final bool status;
  final String message;
  final List<MangaList>? mangaList;

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

  @override
  List<Object?> get props => [status, message, mangaList];
}

class MangaList extends Equatable {
  MangaList({
    this.title = "",
    this.thumb = "",
    this.endpoint = "",
  });

  final String title;
  final String thumb;
  final String endpoint;

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

  @override
  List<Object?> get props => [title, thumb, endpoint];
}
