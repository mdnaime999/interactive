import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../app/common/models/auth.model.dart';
import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/store.service.dart';
import '../../../config/dialogs/sample.dialog.dart';
import '../../../config/style.dart';
import '../../home/route/routes.dart';

class ProfileFirstController extends GetxController {
  final store = Get.find<StoreService>();
  final authService = Get.find<AuthService>();

  TextEditingController userName = TextEditingController();

  @override
  void onInit() {
    if (store.authUser.value.id != null) {
      MAutnUser authUser = store.authUser.value;
      userName.text = authUser.username!;
    }

    super.onInit();
  }

  Future<bool> backToHome() async {
    Get.dialog(
      SampleDialog(
        title: Text(
          "Attention please !!",
          style: dialogTittleStyle,
        ),
        body: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            border: Border.all(color: appThemeColor),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Text(
            "Don't you want to update your profile ?",
            style: GoogleFonts.openSans(
              color: appThemeColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        submitText: "Go to Home",
        submitFun: () async {
          authService.firstOpen.value = false;
          Get.offAllNamed(HomeRoutes.home);
        },
      ),
      barrierDismissible: false,
    );
    return false;
  }
}
