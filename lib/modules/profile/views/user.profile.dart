import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/style.dart';
import '../widgets/profile.live.count.widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              decoration: userProfileTopBg,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.edit_calendar_outlined),
                        Icon(Icons.settings),
                      ],
                    ),
                    CircleAvatar(
                      radius: 10.w,
                      backgroundColor: LoginStyle().logoBg,
                      child: SvgPicture.asset(
                        homeToffeCup,
                        width: double.maxFinite,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Bhadon Ahmed",
                      style: GoogleFonts.inter(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.5.h),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ID:123456',
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Text(
                            'Bangladesh',
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'I Am a new KoKo user',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 10.sp,
                          backgroundColor: Color(0xFFFC1491),
                          child: Icon(Icons.lightbulb_outlined),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xFF0FF04E),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 3.sp),
                            child: Text(
                              "Lv 20",
                              style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        ProfileLiveCount(
                          decoration: profiledtarnd,
                          image: homeToffeCup,
                          tittle: "9",
                        ),
                        SizedBox(width: 2.w),
                        CircleAvatar(
                          radius: 10.sp,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.turn_right),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileLiveCount(
                  image: homeToffeCup,
                  tittle: "0",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                ProfileLiveCount(
                  image: homeToffeCup,
                  tittle: "9",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            Divider(
              color: Colors.grey,
              thickness: 1.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "0",
                        style: GoogleFonts.inter(fontSize: 12.sp),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Friends",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "0",
                        style: GoogleFonts.inter(fontSize: 12.sp),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Following",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "0",
                        style: GoogleFonts.inter(fontSize: 12.sp),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Followers",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "0",
                        style: GoogleFonts.inter(fontSize: 12.sp),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Likes",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.5.h),
            Divider(
              color: Colors.grey,
              thickness: 1.sp,
            ),
            SizedBox(height: 1.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Color(0xFFFFC3D8),
                    ),
                    child: Icon(
                      Icons.camera_rear,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  Text(
                    "TopUp",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 100.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 10.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: CircleAvatar(
                  radius: 6.w,
                  backgroundColor: LoginStyle().logoBg,
                  child: SvgPicture.asset(
                    homeToffeCup,
                    width: double.maxFinite,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Divider(
              color: Colors.grey,
              thickness: 1.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Text(
                "Moments",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
