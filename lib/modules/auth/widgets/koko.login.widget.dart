import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/dialogs/sample.dialog.dart';
import '../../../config/fields/input.field.dart';
import '../../../config/style.dart';

class KokoLogin extends StatelessWidget {
  KokoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          InputFieldOne(
            prefixIcon: Icon(Icons.person, color: Colors.white),
            style: GoogleFonts.inter(
              color: Colors.grey.shade200,
              fontSize: 12.sp,
            ),
            hintText: "Username / ID#",
            hintStyle: GoogleFonts.inter(
              color: Colors.grey.shade200,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 2.h),
          InputFieldOne(
            prefixIcon: Icon(Icons.password, color: Colors.white),
            style: GoogleFonts.inter(
              color: Colors.grey.shade200,
              fontSize: 12.sp,
            ),
            hintText: "Password",
            hintStyle: GoogleFonts.inter(
              color: Colors.grey.shade200,
              fontSize: 12.sp,
            ),
            obscureText: true,
          ),
          SizedBox(height: 1.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.comfortable,
                padding: EdgeInsets.symmetric(vertical: 10.sp),
              ),
              onPressed: () {
                Get.dialog(
                  SampleDialog(
                    title: Text(
                      "Attention!!",
                      style: dialogTittleStyle,
                    ),
                    body: Text(
                      "Please contact Koko official support team on facebook",
                      style: GoogleFonts.inter(
                        color: Colors.grey.shade400,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Forgot Password",
                style: GoogleFonts.inter(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Container(
            width: 100.w,
            decoration: LoginStyle().loginButton,
            child: TextButton(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.comfortable,
                padding: EdgeInsets.all(13.sp),
              ),
              onPressed: () {},
              child: Text(
                "Login",
                style: LoginStyle().loginTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
