import 'package:flutter/material.dart';

var TITLE_TEXT_FONT_SIZE = 16.0;
var BODY1_TEXT_FONT_SIZE = 14.0;
const colorAccentLight = Colors.black;

Text getTitle(String text, {double fontSize}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: fontSize == null ? TITLE_TEXT_FONT_SIZE : fontSize,
    ),
  );
}

Text getSubTitle(String text,
    {bool bold = false,
    bool isCenter = false,
    double fontSize,
    Color color = colorAccentLight,
    int lines}) {
  return Text(
    text,
    maxLines: lines,
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: fontSize == null ? BODY1_TEXT_FONT_SIZE : fontSize,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
