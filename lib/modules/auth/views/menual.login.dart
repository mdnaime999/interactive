import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../config/style.dart';
import '../controllers/menual.login.cont.dart';
import '../widgets/koko.login.widget.dart';
import '../widgets/phone.login.widget.dart';

class MenuaLLoginPage extends StatelessWidget {
  MenuaLLoginPage({super.key});
  final MenualLoginController menualLogCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: LoginStyle().loginBack,
        child: SafeArea(
          child: ListView(
            children: [
              // ------------------------ Logo and text
              if (!menualLogCont.isPhoneLogin.value)
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 13.w,
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
                      Text(
                        LoginStyle().loginText3.toUpperCase(),
                        style: LoginStyle().loginTextStyle3,
                      ),
                      Text(
                        LoginStyle().loginText4,
                        style: LoginStyle().loginTextStyle4,
                      ),
                    ],
                  ),
                ),
              if (menualLogCont.isPhoneLogin.value)
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 6.h),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 13.w,
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
                      Text(
                        LoginStyle().loginText5.toUpperCase(),
                        style: LoginStyle().loginTextStyle3,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 3.h),
              // ------------------------ Login fields
              if (menualLogCont.isPhoneLogin.value) PhoneLogin(),
              if (!menualLogCont.isPhoneLogin.value) KokoLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
