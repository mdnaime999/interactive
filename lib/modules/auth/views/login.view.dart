import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../config/style.dart';
import '../controllers/auth.cont.dart';
import '../controllers/menual.login.cont.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final AuthController authCont = Get.find();
  final MenualLoginController menualLoginCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: LoginStyle().loginBack,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ------------------------ Logo and text
              Container(
                margin: EdgeInsets.only(bottom: 6.h),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 15.w,
                      backgroundColor: LoginStyle().logoBg,
                      child: CircleAvatar(
                        radius: 10.w,
                        backgroundColor: LoginStyle().logoBg,
                        child: SvgPicture.asset(
                          AppStyle().logoSvgAsset,
                          width: double.maxFinite,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3.sp),
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Text(
                        LoginStyle().loginText1.toUpperCase(),
                        style: LoginStyle().loginTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              // ------------------------ Login field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                decoration: FieldStyle().decorationOne,
                child: IntlPhoneField(
                  controller: menualLoginCont.phone.value,
                  disableLengthCheck: false,
                  style: GoogleFonts.inter(color: Colors.grey.shade200),
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: GoogleFonts.inter(color: Colors.grey.shade200),
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  dropdownIcon: Icon(
                    Icons.expand_more,
                    color: Colors.grey.shade200,
                  ),
                  dropdownTextStyle: GoogleFonts.openSans(
                    fontSize: 12.sp,
                    color: Colors.grey.shade200,
                  ),
                  initialCountryCode: 'BD',
                  onCountryChanged: (country) {
                    menualLoginCont.initCountry.value = country;
                    menualLoginCont.countryCode.value = '+${country.dialCode}';
                  },
                  onChanged: menualLoginCont.changePhone,
                  validator: (p0) {
                    if (p0 != null && p0.number != "") {
                      if (p0.number.length >= menualLoginCont.initCountry.value.minLength && p0.number.length <= menualLoginCont.initCountry.value.maxLength) {
                        menualLoginCont.phoneValid.value = true;
                        return null;
                      } else {
                        menualLoginCont.phoneValid.value = false;
                        return "Invalid Phone Number";
                      }
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 2.h),
              // ------------------------ Login Buttons
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: LoginStyle().regButton,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Registration",
                            style: LoginStyle().loginTextStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Expanded(
                      child: Container(
                        decoration: LoginStyle().loginButton,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                          ),
                          onPressed: menualLoginCont.phoneSigninFun,
                          child: Text(
                            "Login",
                            style: LoginStyle().loginTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // // ------------------------ Facebook button
              // SocalButton(
              //   icon: SvgPicture.asset(
              //     LoginStyle().facebookLogo,
              //     width: 11.w,
              //   ),
              //   text: "Log in with Facebook",
              //   colors: LoginStyle().facebookButtonBg,
              //   onClick: () {
              //     Get.toNamed(AuthRoutes.profileset);
              //   },
              // ),
              // SizedBox(height: 1.5.h),
              // // ------------------------ Google button
              // SocalButton(
              //   icon: SvgPicture.asset(
              //     LoginStyle().googleLogo,
              //     width: 11.w,
              //   ),
              //   text: "Log in with Google",
              //   colors: LoginStyle().googleButtonBg,
              //   onClick: () {
              //     authCont.handleSignIn();
              //   },
              // ),
              // SizedBox(height: 1.5.h),
              // // ------------------------ Twitter button
              // SocalButton(
              //   icon: SvgPicture.asset(
              //     LoginStyle().twitterLogo,
              //     width: 11.w,
              //   ),
              //   text: "Log in with Twitter",
              //   colors: LoginStyle().twitterButtonBg,
              //   onClick: null,
              // ),
              // SizedBox(height: 3.h),
              // // ------------------------ OR
              // Container(
              //   width: 100.w,
              //   margin: EdgeInsets.symmetric(horizontal: 6.w),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Divider(
              //           color: Colors.white,
              //           thickness: 1.sp,
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.symmetric(horizontal: 10.sp),
              //         child: Text(
              //           "or".toUpperCase(),
              //           style: LoginStyle().loginTextStyle,
              //         ),
              //       ),
              //       Expanded(
              //         child: Divider(
              //           color: Colors.white,
              //           thickness: 1.sp,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 2.h),
              // ------------------------ Action button
              Obx(
                () => AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: authCont.menualWidget.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
