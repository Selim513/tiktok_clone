import 'package:flutter/material.dart';

OutlineInputBorder customOutLineBorders({Color? color, double? circular}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(circular ?? 15)),
      borderSide: BorderSide(color: color ?? const Color(0xffE6E6E6)));
}