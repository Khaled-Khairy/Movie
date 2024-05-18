import 'package:flutter/material.dart';

extension SizeExtension on num {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / 915);
  }

  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / 412);
  }
}
