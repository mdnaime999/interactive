import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../config/dialogs/sample.dialog.dart';
import '../../../config/style.dart';
import '../controllers/menual.login.cont.dart';
import 'pinput.widget.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({super.key});
  final MenualLoginController menualLogCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            decoration: FieldStyle().decorationOne,
            child: IntlPhoneField(
              controller: menualLogCont.phone.value,
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
                menualLogCont.initCountry.value = country;
                menualLogCont.countryCode.value = '+${country.dialCode}';
              },
              onChanged: menualLogCont.changePhone,
              validator: (p0) {
                if (p0 != null && p0.number != "") {
                  if (p0.number.length >=
                          menualLogCont.initCountry.value.minLength &&
                      p0.number.length <=
                          menualLogCont.initCountry.value.maxLength) {
                    menualLogCont.phoneValid.value = true;
                    return null;
                  } else {
                    menualLogCont.phoneValid.value = false;
                    return "Invalid Phone Number";
                  }
                }
                return null;
              },
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
              onPressed: () {
                Get.dialog(
                  SampleDialog(
                    title: Text(
                      "Enter Your OTP",
                      style: dialogTittleStyle,
                    ),
                    body: PinPutWidget(),
                    submitText: "Confirm",
                    submitFun: () {},
                  ),
                );
              },
              child: Text(
                "Send Verification Code",
                style: LoginStyle().loginTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
