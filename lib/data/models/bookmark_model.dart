// To parse this JSON data, do
//
//     final bookmarkModel = bookmarkModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

BookmarkModel bookmarkModelFromJson(String str) =>
    BookmarkModel.fromJson(json.decode(str));

String bookmarkModelToJson(BookmarkModel data) => json.encode(data.toJson());

class BookmarkModel extends Equatable {
  BookmarkModel({
    this.index = 0,
    this.title = "",
    this.thumb = "",
    this.endpoint = "",
    this.chapter = "",
    this.totalChapter = 0,
    this.isBookmark = false,
  });

  final int index;
  final String title;
  final String thumb;
  final String endpoint;
  final String chapter;
  final int totalChapter;
  final bool isBookmark;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        index: json["index"],
        title: json["title"],
        thumb: json["thumb"],
        endpoint: json["endpoint"],
        chapter: json["chapter"],
        totalChapter: json["total_chapter"],
        isBookmark: json["is_bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "title": title,
        "thumb": thumb,
        "endpoint": endpoint,
        "chapter": chapter,
        "total_chapter": totalChapter,
        "is_bookmark": isBookmark,
      };

  @override
  List<Object?> get props => [
        index,
        title,
        thumb,
        endpoint,
        chapter,
        totalChapter,
        isBookmark,
      ];
}
