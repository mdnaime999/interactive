// ignore_for_file: unused_import

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';
import 'dart:developer' as dev;

import '../../../app/common/models/auth.model.dart';
import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/database.service.dart';
import '../../../app/services/database/store.service.dart';
import '../../../config/style.dart';
import '../../home/route/routes.dart';
import '../widgets/circle.button.widget.dart';
import 'menual.login.cont.dart';

class AuthController extends GetxController {
  final menualLC = Get.find<MenualLoginController>();
  final dbs = Get.find<DatabaseService>();
  final store = Get.find<StoreService>();
  final authService = Get.find<AuthService>();
  RxBool moreWidget = true.obs;
  Rx<Widget> menualWidget = SizedBox().paddingZero.obs;
  GetStorage db = GetStorage('store');

  // ---- Google ----
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;
  // ---- Firebase ----
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    // ---- Firebase Init ----
    await getFirebaseToken();

    menualWidget.value = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 18.sp),
        shape: CircleBorder(),
      ),
      onPressed: () => moreVartCircle(),
      child: Icon(Icons.more_horiz),
    );

    super.onInit();
  }

  Future<void> googleSigninFun() async {
    try {
      await googleSignIn.signIn().then((user) async {
        GoogleSignInAuthentication userData = await user!.authentication;
        OAuthCredential authCredential = GoogleAuthProvider.credential(accessToken: userData.accessToken, idToken: userData.idToken);
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential);
        MAutnUser authUser = MAutnUser(
          id: 001,
          uid: userCredential.user!.uid,
          username: user.displayName,
          email: user.email,
          image: user.photoUrl,
          accessToken: userCredential.credential!.accessToken,
        );
        loginAuth(authUser);
      });
    } catch (error) {
      print(error);
    }
  }

  void loginAuth(MAutnUser returnData) {
    db.write('auth', mAutnUserToJson(returnData)).then((_) {
      print("---- go to home (Login) ----");
      authService.authCheck().then((__) {
        Get.offAllNamed(HomeRoutes.home);
      });
    });
  }

  Future<String> getFirebaseToken() async {
    String? token = await messaging.getToken();
    if (token != null) {
      store.fcmToken.value = token;
    }
    return token!;
  }

  void moreVartCircle() {
    if (moreWidget.value) {
      menualWidget.value = Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                  padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 18.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      LoginStyle().facebookLogo,
                      width: 6.w,
                    ),
                    SizedBox(width: 5.sp),
                    Text(
                      "Facebook",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            CircleButton(
              icon: Icon(Icons.close),
              color: Colors.teal,
              onClick: () {
                menualLC.isPhoneLogin.value = false;
                moreVartCircle();
              },
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  googleSigninFun();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                  padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 18.sp),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      LoginStyle().googleLogo,
                      width: 6.w,
                    ),
                    SizedBox(width: 5.sp),
                    Text(
                      "Google",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      moreWidget.value = false;
    } else {
      menualWidget.value = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 18.sp),
          shape: CircleBorder(),
        ),
        onPressed: () => moreVartCircle(),
        child: Icon(Icons.more_horiz),
      );
      moreWidget.value = true;
    }
  }
}
