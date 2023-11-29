import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/style.dart';
import '../../drowar/custom.drawer.dart';
import '../../menu/services/bottom.nav.service.dart';
import '../../menu/views/bottom.nav.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final BottomMenuService menuService = Get.find<BottomMenuService>();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: homeBackBg,
          child: SafeArea(
            child: Column(
              children: [
                /*------------------------------- logo and drowar ----------------------------*/
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  decoration: BoxDecoration(
                    color: homeBackBg,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 0.1,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 6.w,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          AppStyle().logoSvgAsset,
                        ),
                      ),
                      Text(
                        "Dashboard".toUpperCase(),
                        style: GoogleFonts.raleway(
                          color: Colors.teal.shade800,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          menuService.drawerController.open!();
                        },
                        iconSize: 25.sp,
                        color: Colors.grey,
                        style: IconButton.styleFrom(
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                        ),
                        // padding: EdgeInsets.all(10.sp),
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavMenu(),
      ),
    );
  }
}
