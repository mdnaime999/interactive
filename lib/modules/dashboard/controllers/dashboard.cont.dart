// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'dart:developer' as dev;

import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/database.service.dart';
import '../../../app/services/database/store.service.dart';

class DashboardController extends GetxController {
  final store = Get.find<StoreService>();
  final as = Get.find<AuthService>();
  final dbs = Get.find<DatabaseService>();
  final yt = YoutubeExplode();

  var refreshController = RefreshController(initialRefresh: false).obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<String> uIdList = <String>[].obs;
  RxList<Playlist> allPlaylist = <Playlist>[].obs;

  @override
  void onInit() async {
    getFirebase();
    super.onInit();
  }

  void onReLoad() async {
    refreshController.value.refreshCompleted();
    getFirebase();
  }

  Future<void> getFirebase() async {
    await dbs.getFirestore().then((query) async {
      uIdList.clear();
      for (QueryDocumentSnapshot<Object?> doc in query.docs) {
        uIdList.add(doc.get('url'));
      }
      getData();
    });
  }

  Future<void> getData() async {
    allPlaylist.clear();
    for (String uId in uIdList) {
      await yt.playlists.get(uId).then((pls) async {
        print(pls.url);
        await for (Video video in yt.playlists.getVideos(pls.id)) {
          print(video.url);
          print(video.thumbnails.standardResUrl);
          // as.cachImage(pls.thumbnails.highResUrl);
        }
        allPlaylist.add(pls);
      });
    }

    // // var title = playlist.title;
    // // var author = playlist.author;

    // await for (var video in yt.playlists.getVideos(playlist.id)) {
    //   print(video);
    // }

    // var playlistVideos = yt.playlists.getVideos(playlist.id);

    // Get first 20 playlist videos.
    // var somePlaylistVideos = await yt.playlists.getVideos(playlist.id).take(20);
  }
}
