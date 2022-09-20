import 'package:flutter/material.dart';

class VideoItemStyle extends TextStyle {
  const VideoItemStyle({
    double fontSize = 12.0,
    FontWeight fontWeight,
    Color color = Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
    inherit: false,
    color: color,
    fontFamily: 'Raleway',
    fontSize: fontSize,
    fontWeight: fontWeight,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: letterSpacing,
    height: height,
  );
}
