import 'package:flutter/material.dart';

class MenuModel {
  MenuModel({this.icon, this.title, this.action, this.activeColor, this.inactiveColor});

  Widget? icon;
  String? title;
  String? action;
  Color? activeColor;
  Color? inactiveColor;
}
