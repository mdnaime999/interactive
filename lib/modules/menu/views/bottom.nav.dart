// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../services/bottom.nav.service.dart';

class BottomNavMenu extends StatelessWidget {
  BottomNavMenu({super.key});
  final bms = Get.find<BottomMenuService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.sp),
          topRight: Radius.circular(10.sp),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 8.h,
        padding: EdgeInsets.all(5.sp),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bms.items.map((item) {
                int index = bms.items.indexOf(item);
                return Flexible(
                  child: GestureDetector(
                    onTap: () => bms.buttonAction(index),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: SvgPicture.asset(
                        item.iconPath!,
                        color: bms.selectedIndex.value == index ? item.activeColor : item.inactiveColor,
                      ),
                      // child: IconTheme(
                      //   data: IconThemeData(
                      //     size: 26.0,
                      //     color: bms.selectedIndex.value == index ? item.activeColor : item.inactiveColor,
                      //   ),
                      //   child: item.icon,
                      // ),
                    ),
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
