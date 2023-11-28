import 'package:flutter/material.dart';

class MenuModel {
  MenuModel({this.iconPath, this.title, this.action, this.activeColor, this.inactiveColor});

  String? iconPath;
  String? title;
  String? action;
  Color? activeColor;
  Color? inactiveColor;
}
