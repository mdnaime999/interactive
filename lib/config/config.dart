import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../modules/auth/route/routes.dart';
import '../modules/home/route/routes.dart';
import '../modules/profile/route/routes.dart';
import 'dialogs/body.dialog.dart';
import 'style.dart';

// ============= app config
String appName = "Chandpur District Police";
String baseUrl = "https://b2df-113-11-83-32.ngrok-free.app/";
// ============= app Storege
GetStorage db = GetStorage('store');

// ============= app modules
List modules = [
  HomeRoutes.routes,
  AuthRoutes.routes,
  ProfileRoutes.routes,
];

// App Close
Future<bool> appClose() async {
  Get.dialog(
    ShowDialogWithBody(
      title: "Attention please !!",
      body: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          border: Border.all(color: appThemeColor),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(
          "Do you want to close this application ?",
          style: GoogleFonts.openSans(
            color: appThemeColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      submitText: "Exit",
      submitFun: () async {
        Get.back();
        SystemNavigator.pop(animated: true);
      },
    ),
    barrierDismissible: false,
  );
  return false;
}
