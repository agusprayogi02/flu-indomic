import 'package:flutter/material.dart';

const BASE_URL = 'https://mangamint.kaedenoki.net/api/';

const Color textC = Color(0xFFFFFFFF);
const Color blackC = Color(0xFF000000);
const Color primaryC = Color(0xFF3D5AFE);
const Color lightPrimaryC = Color(0xFF8187FF);
const Color darkPrimaryC = Color(0xFF0031CA);
const Color greyC = Color(0xFFE0E0E0);
const Color greyDarkC = Color(0xFF757575);

const double defaultPadding = 8;
const double defaultMargin = 8;

// settingan border radius default
Radius defaultRadius({double radius = 8}) => Radius.circular(radius);

BorderRadius borderRadiusAll({double radius = 8}) =>
    BorderRadius.all(defaultRadius(radius: radius));

BorderRadius borderRadiusOnly({
  double tLeft = 0,
  double tRight = 0,
  double bLeft = 0,
  double bRight = 0,
}) =>
    BorderRadius.only(
      topLeft: defaultRadius(radius: tLeft),
      topRight: defaultRadius(radius: tRight),
      bottomLeft: defaultRadius(radius: bLeft),
      bottomRight: defaultRadius(radius: bRight),
    );

// untuk menghapus karakter slash dan mengambil string pertama
String splitSlash(String val) {
  var listString = val.split('/');
  return listString[0];
}
