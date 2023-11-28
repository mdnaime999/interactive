// To parse this JSON data, do
//
//     final mSocal = mSocalFromJson(jsonString);

import 'dart:convert';

MSocal mSocalFromJson(String str) => MSocal.fromJson(json.decode(str));

String mSocalToJson(MSocal data) => json.encode(data.toJson());

class MSocal {
  final String? name;
  final String? email;
  final String? photo;

  MSocal({
    this.name,
    this.email,
    this.photo,
  });

  factory MSocal.fromJson(Map<String, dynamic> json) => MSocal(
        name: json["name"],
        email: json["email"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "photo": photo,
      };
}
