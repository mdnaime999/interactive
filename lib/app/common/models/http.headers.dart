// To parse this JSON data, do
//
//     final httpHeaderApi = httpHeaderApiFromJson(jsonString);

import 'dart:convert';

HttpHeaderApi httpHeaderApiFromJson(String str) => HttpHeaderApi.fromJson(json.decode(str));

String httpHeaderApiToJson(HttpHeaderApi data) => json.encode(data.toJson());

class HttpHeaderApi {
  HttpHeaderApi({
    this.accessControlAllowOrigin = "*",
    this.accessControlAllowCredentials = "true",
    this.accessControlAllowHeaders = "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    this.accessControlAllowMethods = "POST, OPTIONS",
    this.contentType = "application/json",
    this.authorization,
  });

  final String accessControlAllowOrigin;
  final String accessControlAllowCredentials;
  final String accessControlAllowHeaders;
  final String accessControlAllowMethods;
  final String contentType;
  String? authorization;

  factory HttpHeaderApi.fromJson(Map<String, dynamic> json) => HttpHeaderApi(
        accessControlAllowOrigin: json["Access-Control-Allow-Origin"],
        accessControlAllowCredentials: json["Access-Control-Allow-Credentials"],
        accessControlAllowHeaders: json["Access-Control-Allow-Headers"],
        accessControlAllowMethods: json["Access-Control-Allow-Methods"],
        contentType: json["Content-Type"],
        authorization: json["Authorization"],
      );

  Map<String, String> toJson() => {
        "Access-Control-Allow-Origin": accessControlAllowOrigin,
        "Access-Control-Allow-Credentials": accessControlAllowCredentials,
        "Access-Control-Allow-Headers": accessControlAllowHeaders,
        "Access-Control-Allow-Methods": accessControlAllowMethods,
        "Content-Type": contentType,
        "Authorization": authorization.toString(),
      };
}
