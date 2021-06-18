// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ChapterModel chapterModelFromJson(String str) =>
    ChapterModel.fromJson(json.decode(str));

String chapterModelToJson(ChapterModel data) => json.encode(data.toJson());

class ChapterModel extends Equatable {
  ChapterModel({
    this.chapterEndpoint = "",
    this.chapterName = "",
    this.chapterPages = 0,
    this.chapterImage,
  });

  final String chapterEndpoint;
  final String chapterName;
  final int chapterPages;
  final List<ChapterImage>? chapterImage;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        chapterEndpoint: json["chapter_endpoint"],
        chapterName: json['chapter_name'],
        chapterPages: json["chapter_pages"],
        chapterImage: List<ChapterImage>.from(
            json["chapter_image"].map((x) => ChapterImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapter_endpoint": chapterEndpoint,
        "chapter_name": chapterName,
        "chapter_pages": chapterPages,
        "chapter_image":
            List<dynamic>.from(chapterImage!.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [chapterEndpoint, chapterName, chapterPages, chapterImage];
}

class ChapterImage extends Equatable {
  ChapterImage({
    this.chapterImageLink = "",
    this.imageNumber = 0,
  });

  final String chapterImageLink;
  final int imageNumber;

  factory ChapterImage.fromJson(Map<String, dynamic> json) => ChapterImage(
        chapterImageLink: json["chapter_image_link"],
        imageNumber: json["image_number"],
      );

  Map<String, dynamic> toJson() => {
        "chapter_image_link": chapterImageLink,
        "image_number": imageNumber,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [chapterImageLink, imageNumber];
}
