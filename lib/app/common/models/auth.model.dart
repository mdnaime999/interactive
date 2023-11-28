// To parse this JSON data, do
//
//     final mAutnUser = mAutnUserFromJson(jsonString);

import 'dart:convert';

MAutnUser mAutnUserFromJson(String str) => MAutnUser.fromJson(json.decode(str));

String mAutnUserToJson(MAutnUser data) => json.encode(data.toJson());

class MAutnUser {
  final int? id;
  final String? uid;
  final String? username;
  final String? email;
  final String? phone;
  final String? image;
  final String? address;
  final String? accessToken;
  final String? status;

  MAutnUser({
    this.id,
    this.uid,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.address,
    this.accessToken,
    this.status,
  });

  factory MAutnUser.fromJson(Map<String, dynamic> json) => MAutnUser(
        id: json["id"],
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        address: json["address"],
        accessToken: json["accessToken"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "username": username,
        "email": email,
        "phone": phone,
        "image": image,
        "address": address,
        "accessToken": accessToken,
        "status": status,
      };
}
