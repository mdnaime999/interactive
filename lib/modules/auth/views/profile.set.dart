// ignore_for_file: unused_import, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart' as Badges;

import '../../../config/fields/input.field.dart';
import '../../../config/style.dart';
import '../controllers/profile.first.cont.dart';

class ProfileSet extends StatelessWidget {
  ProfileSet({super.key});
  final ProfileFirstController profileCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: profileCont.backToHome,
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*-------------------------------- Profile picture--------------------*/
                  Badges.Badge(
                    position: Badges.BadgePosition.bottomEnd(
                      bottom: 0.8.h,
                      end: -1.w,
                    ),
                    showBadge: true,
                    ignorePointer: false,
                    badgeContent: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        camera,
                        width: double.maxFinite,
                      ),
                    ),
                    onTap: () {},
                    badgeAnimation: Badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 2),
                      colorChangeAnimationDuration: Duration(seconds: 2),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeStyle: Badges.BadgeStyle(
                      padding: EdgeInsets.zero,
                      badgeColor: Colors.white,
                    ),
                    child: CircleAvatar(
                      radius: 15.w,
                      backgroundColor: LoginStyle().logoBg,
                      child: SvgPicture.asset(
                        homeToffeCup,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text("Chosse Profile picture"),
                  SizedBox(height: 5.h),
                  /*-------------------------------- input field--------------------*/
                  InputFieldOne(
                    controller: profileCont.userName,
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                    hintText: "User Name",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  InputFieldOne(
                    prefixIcon: Icon(Icons.contact_emergency_outlined, color: Colors.black),
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade200,
                      fontSize: 12.sp,
                    ),
                    hintText: "Surmark",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  InputFieldOne(
                    prefixIcon: Icon(Icons.mail_lock_outlined, color: Colors.black),
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade200,
                      fontSize: 12.sp,
                    ),
                    hintText: "tlukdernazmul04@gmail.com",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  InputFieldOne(
                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade200,
                      fontSize: 12.sp,
                    ),
                    hintText: "01766119171",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  InputFieldOne(
                    prefixIcon: Icon(Icons.edit, color: Colors.black),
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade200,
                      fontSize: 12.sp,
                    ),
                    hintText: "I come Back",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  /*--------------------------------save and continue button--------------------*/
                  Container(
                    width: 100.w,
                    decoration: profileSaveBtn,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        padding: EdgeInsets.all(13.sp),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Save to Continue",
                        style: LoginStyle().loginTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
