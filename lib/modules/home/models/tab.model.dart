import 'package:flutter/material.dart';

class TabModel {
  TabModel({
    required this.title,
    this.action,
    this.activeColor,
    this.inactiveColor,
  });

  String title;
  String? action;
  List<Color>? activeColor;
  List<Color>? inactiveColor;
}

List<TabModel> tabListData = [
  TabModel(
    title: "Populer",
    activeColor: [
      Color(0xFF9351F6),
      Color(0xFF4B13E9)
    ],
    action: "populer",
    inactiveColor: [
      Colors.white,
      Colors.white
    ],
  ),
  TabModel(
    title: "Floower",
    activeColor: [
      Color(0xFF9351F6),
      Color(0xFF4B13E9)
    ],
    action: "following",
    inactiveColor: [
      Colors.white,
      Colors.white
    ],
  ),
  TabModel(
    title: "Audio Party",
    activeColor: [
      Color(0xFF9351F6),
      Color(0xFF4B13E9)
    ],
    action: "audio",
    inactiveColor: [
      Colors.white,
      Colors.white
    ],
  ),
  TabModel(
    title: "Pk Match",
    activeColor: [
      Color(0xFF9351F6),
      Color(0xFF4B13E9)
    ],
    action: "pk",
    inactiveColor: [
      Colors.white,
      Colors.white
    ],
  ),
];
