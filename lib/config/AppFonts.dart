import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Appfonts {
  static mainStyle(Color color,
          {String font = 'Ossem',
          double size = 8,
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
          color: color, fontFamily: font, fontSize: size, fontWeight: weight);
}
