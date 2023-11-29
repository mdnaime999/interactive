// To parse this JSON data, do
//
//     final mStream = mStreamFromJson(jsonString);

import 'dart:convert';

import '../../../app/common/models/auth.model.dart';
import '../../../app/common/models/enum.model.dart';

List<MStream> mStreamFromJson(String str) => List<MStream>.from(json.decode(str).map((x) => MStream.fromJson(x)));

String mStreamToJson(List<MStream> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MStream {
  final int? id;
  final String? channelName;
  final StreamStatus? status;
  final String? homeImageUrl;
  final LiveType? liveType;
  final List<dynamic>? audienceUids;
  final List<dynamic>? bootUsers;
  final List<dynamic>? blacklist;
  final MAutnUser? hostUser;

  MStream({
    this.id,
    this.channelName,
    this.status,
    this.homeImageUrl,
    this.liveType,
    this.audienceUids,
    this.bootUsers,
    this.blacklist,
    this.hostUser,
  });

  factory MStream.fromJson(Map<String, dynamic> json) => MStream(
        id: json["id"],
        channelName: json["channel_name"],
        status: streamStatusValues.map[json["status"]],
        homeImageUrl: json["home_image_url"],
        liveType: liveTypeValues.map[json["live_type"]],
        audienceUids: List<dynamic>.from(json["audience_uids"].map((x) => x)),
        bootUsers: List<dynamic>.from(json["boot_users"].map((x) => x)),
        blacklist: List<dynamic>.from(json["blacklist"].map((x) => x)),
        hostUser: MAutnUser.fromJson(json["host_user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "channel_name": channelName,
        "status": streamStatusValues.reverse[status],
        "home_image_url": homeImageUrl,
        "live_type": liveTypeValues.reverse[liveType],
        "audience_uids": List<dynamic>.from(audienceUids!.map((x) => x)),
        "boot_users": List<dynamic>.from(bootUsers!.map((x) => x)),
        "blacklist": List<dynamic>.from(blacklist!.map((x) => x)),
        "host_user": hostUser!.toJson(),
      };
}
