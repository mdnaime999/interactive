import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../controllers/tab.cont.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final HomeTabController tabCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabCont.tabList.map((tab) {
            var index = tabCont.tabList.indexOf(tab);
            return InkWell(
              onTap: () => tabCont.tabAction(index),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: tabCont.selectedTab.value == index ? tab.activeColor! : tab.inactiveColor!,
                  ),
                  border: Border.all(
                    width: 1.sp,
                    color: Color(0xFFDEF4FF),
                  ),
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                  child: Text(
                    tab.title,
                    style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      color: tabCont.selectedTab.value == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
