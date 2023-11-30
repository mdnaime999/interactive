import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../config/config.dart';
import '../../../modules/home/route/routes.dart';
import '../../common/models/auth.model.dart';
import '../../common/models/http.headers.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    authCheck();
    return this;
  }

  RxBool authenticate = false.obs;
  RxBool firstOpen = false.obs;
  Rx<HttpHeaderApi> headers = HttpHeaderApi().obs;

  // Socal
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> authCheck() async {
    if (db.read('auth') != null) {
      MAutnUser? auth = mAutnUserFromJson(db.read('auth'));
      print(auth.toJson());
      if (auth.id != null) {
        authenticate.value = true;
      } else {
        authenticate.value = false;
        db.remove('auth');
      }
    } else {
      authenticate.value = false;
    }
  }

  // logout
  Future<void> signOut() async {
    print("--- Go to login (Logout) ---");
    googleSignIn.disconnect();
    if (db.read('auth') != null) {
      MAutnUser? auth = mAutnUserFromJson(db.read('auth'));
      if (auth.id != null) {
        db.remove('auth').then((_) {
          authCheck().then((__) {
            Get.offAllNamed(HomeRoutes.home);
          });
        });
      }
    } else {
      authCheck().then((__) {
        Get.offAllNamed(HomeRoutes.home);
      });
    }
  }

  Future<void> cachImage(String url) async {
    await DefaultCacheManager().getSingleFile(url);
  }
}
