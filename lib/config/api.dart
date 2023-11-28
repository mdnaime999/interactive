import 'config.dart';

class Api {
  String socialLogin = "auth/social_login";
  String liveStreamsList = "live_streams_list";

  Uri generateApi(String url) {
    return Uri.parse(baseUrl + url);
  }
}
