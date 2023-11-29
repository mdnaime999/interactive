import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../app/services/auth/auth.service.dart';
import '../../config/config.dart';
import '../../config/dialogs/body.dialog.dart';
import '../../config/style.dart';
import '../auth/route/routes.dart';
import '../home/route/routes.dart';
import '../menu/services/bottom.nav.service.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, this.bg, required this.child});
  final BottomMenuService menuService = Get.find<BottomMenuService>();
  final authService = Get.find<AuthService>();
  final Color? bg;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: menuService.drawerController,
      openCurve: Curves.fastOutSlowIn,
      mainScreenTapClose: true,
      mainScreenScale: 0.3,
      borderRadius: 10.sp,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: bg ?? drawerBg,
      menuScreenOverlayColor: HSLColor.fromColor(bg ?? drawerBg).withLightness(1).toColor(),
      drawerShadowsBackgroundColor: HSLColor.fromColor(bg ?? drawerBg).withLightness(0.9).toColor(),
      slideWidth: 70.w,
      mainScreen: child,
      menuScreen: WillPopScope(
        onWillPop: () => appClose(),
        child: Scaffold(
          backgroundColor: bg ?? drawerBg,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 15.w,
                        backgroundColor: Colors.white70,
                        child: SvgPicture.asset(
                          AppStyle().logoSvgAsset,
                          width: 20.w,
                          // color: Colors.amber,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppStyle().companyName,
                          style: GoogleFonts.raleway(
                            color: HSLColor.fromColor(bg ?? drawerBg).withLightness(1).toColor(),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (authService.authenticate.value)
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 5.sp),
                          child: Text(
                            "Admin",
                            style: GoogleFonts.raleway(
                              color: HSLColor.fromColor(bg ?? drawerBg).withLightness(1).toColor(),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Expanded(
                  child: Obx(
                    () => SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: menuService.drawerMenuList
                            .map(
                              (menuItem) => Container(
                                margin: EdgeInsets.only(left: 10.sp, bottom: 5.sp),
                                padding: EdgeInsets.all(5.sp),
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: menuItem.clicked!.value ? HSLColor.fromColor(bg ?? drawerBg).withLightness(0.8).toColor() : bg ?? drawerBg,
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                                child: InkWell(
                                  onTap: menuItem.action,
                                  onTapDown: (details) => menuItem.clicked!.value = true,
                                  onTapUp: (details) => menuItem.clicked!.value = false,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      if (menuItem.icon != null)
                                        Icon(
                                          menuItem.icon,
                                          size: 20.sp,
                                          color: menuItem.clicked!.value ? HSLColor.fromColor(bg ?? drawerBg).withLightness(0.2).toColor() : HSLColor.fromColor(bg ?? drawerBg).withLightness(1).toColor(),
                                        ),
                                      if (menuItem.icon != null) SizedBox(width: 10.sp),
                                      Expanded(
                                        child: Text(
                                          "${menuItem.title}",
                                          style: GoogleFonts.raleway(
                                            color: menuItem.clicked!.value ? HSLColor.fromColor(bg ?? drawerBg).withLightness(0.2).toColor() : HSLColor.fromColor(bg ?? drawerBg).withLightness(1).toColor(),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () {
                    return Container(
                      margin: EdgeInsets.only(left: 10.sp),
                      // alignment: Alignment.center,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: HSLColor.fromColor(bg ?? drawerBg).withLightness(0.8).toColor(),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity, horizontal: VisualDensity.minimumDensity),
                          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                          foregroundColor: HSLColor.fromColor(bg ?? drawerBg).withLightness(0.2).toColor(),
                        ),
                        onPressed: authService.authenticate.value
                            ? () => Get.dialog(
                                  ShowDialogWithBody(
                                    title: "Attention!!!",
                                    body: Text("Are you Sure Logout"),
                                    submitText: "Yes",
                                    submitFun: () {
                                      authService.signOut();
                                      Get.toNamed(HomeRoutes.home);
                                    },
                                    cancelText: "No",
                                    cancelFun: () {
                                      Get.back();
                                    },
                                  ),
                                )
                            : () => Get.toNamed(AuthRoutes.login),
                        icon: Icon(
                          Icons.logout_outlined,
                          size: 20.sp,
                        ),
                        label: Text(
                          authService.authenticate.value ? "Logout" : "Login",
                          style: GoogleFonts.raleway(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
