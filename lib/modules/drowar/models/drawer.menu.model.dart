// To parse this JSON data, do
//
//     final mDrawerMenu = mDrawerMenuFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<MDrawerMenu> mDrawerMenuFromJson(String str) => List<MDrawerMenu>.from(json.decode(str).map((x) => MDrawerMenu.fromJson(x)));

String mDrawerMenuToJson(List<MDrawerMenu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MDrawerMenu {
  MDrawerMenu({
    this.icon,
    this.title,
    this.action,
    this.clicked,
  });

  final IconData? icon;
  final String? title;
  final Function()? action;
  RxBool? clicked;

  factory MDrawerMenu.fromJson(Map<String, dynamic> json) => MDrawerMenu(
        icon: json["icon"],
        title: json["title"],
        action: json["action"],
        clicked: json["clicked"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "action": action,
        "clicked": clicked,
      };
}
