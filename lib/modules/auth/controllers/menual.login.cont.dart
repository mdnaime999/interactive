import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../../app/common/models/auth.model.dart';
import '../../../config/dialogs/sample.dialog.dart';
import '../../../config/style.dart';
import '../widgets/pinput.widget.dart';
import 'auth.cont.dart';

class MenualLoginController extends GetxController {
  RxBool isPhoneLogin = true.obs;

  Rx<TextEditingController> phone = TextEditingController().obs;
  RxString countryCode = '+880'.obs;
  Rx<Country> initCountry = countries[18].obs;
  RxBool phoneValid = false.obs;

  RxBool onSubmit = false.obs;
  final pinputFocusNode = FocusNode();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.raleway(
      color: Colors.green.shade900,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green.shade900),
      borderRadius: BorderRadius.circular(15.sp),
    ),
  );
  Rx<TextEditingController> pin = TextEditingController().obs;

  Future<void> phoneSigninFun() async {
    if (phone.value.text.length >= initCountry.value.minLength && phone.value.text.length <= initCountry.value.maxLength) {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "${countryCode.value}${phone.value.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            pin.value.text = "";
            Get.dialog(
              SampleDialog(
                title: Text(
                  "Enter Your OTP",
                  style: dialogTittleStyle,
                ),
                body: PinPutWidget(),
                submitText: "Confirm",
                submitFun: () async {
                  final authCont = Get.find<AuthController>();
                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: pin.value.text);
                    UserCredential userCredential = await auth.signInWithCredential(credential);

                    MAutnUser authUser = MAutnUser(
                      id: 001,
                      uid: userCredential.user!.uid,
                      phone: userCredential.user!.phoneNumber,
                    );
                    Get.back();
                    authCont.loginAuth(authUser);
                  } catch (e) {
                    Get.snackbar("Error", "Worng otp please try again");
                  }
                },
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (error) {
        print(error);
      }
    } else {
      Get.snackbar("Error", "Worng phone number try again");
    }
  }

  PinTheme pinputFocus() {
    return defaultPinTheme.copyWith(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade900),
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );
  }

  void changePhone(phoneNumber) {
    if (phone.value.text != "") {
      var pn = phone.value.text.split('');
      if (countryCode.value == '+880' && pn[0] == '0') {
        phone.value.clear();
      }
    }
    submitChange();
  }

  void submitChange() {
    if (phone.value.text == "") {
      onSubmit.value = false;
    } else if (phoneValid.isFalse) {
      onSubmit.value = false;
    } else {
      onSubmit.value = true;
    }
  }
}
