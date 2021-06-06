// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

DetailModel detailModelFromJson(String str) =>
    DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel extends Equatable {
  DetailModel({
    this.title = "",
    this.type = "",
    this.author = "",
    this.status = "",
    this.mangaEndpoint = "",
    this.thumb = "",
    this.genreList,
    this.synopsis = "",
    this.chapter,
  });

  final String title;
  final String type;
  final String author;
  final String status;
  final String mangaEndpoint;
  final String thumb;
  final List<GenreList>? genreList;
  final String synopsis;
  final List<Chapter>? chapter;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        title: json["title"],
        type: json["type"],
        author: json["author"],
        status: json["status"],
        mangaEndpoint: json["manga_endpoint"],
        thumb: json["thumb"],
        genreList: List<GenreList>.from(
            json["genre_list"].map((x) => GenreList.fromJson(x))),
        synopsis: json["synopsis"],
        chapter:
            List<Chapter>.from(json["chapter"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
        "author": author,
        "status": status,
        "manga_endpoint": mangaEndpoint,
        "thumb": thumb,
        "genre_list": List<dynamic>.from(genreList!.map((x) => x.toJson())),
        "synopsis": synopsis,
        "chapter": List<dynamic>.from(chapter!.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        type,
        author,
        status,
        mangaEndpoint,
        thumb,
        genreList,
        synopsis,
        chapter,
      ];
}

class Chapter extends Equatable {
  Chapter({
    this.chapterTitle = "",
    this.chapterEndpoint = "",
  });

  final String chapterTitle;
  final String chapterEndpoint;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        chapterTitle: json["chapter_title"],
        chapterEndpoint: json["chapter_endpoint"],
      );

  Map<String, dynamic> toJson() => {
        "chapter_title": chapterTitle,
        "chapter_endpoint": chapterEndpoint,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chapterTitle, chapterEndpoint];
}

class GenreList extends Equatable {
  GenreList({
    this.genreName = "",
  });

  final String genreName;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreName: json["genre_name"],
      );

  Map<String, dynamic> toJson() => {
        "genre_name": genreName,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [genreName];
}
