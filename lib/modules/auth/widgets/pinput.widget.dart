import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../controllers/menual.login.cont.dart';

class PinPutWidget extends StatelessWidget {
  PinPutWidget({super.key});
  final MenualLoginController menualLoginCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          child: Pinput(
            length: 6,
            controller: menualLoginCont.pin.value,
            defaultPinTheme: menualLoginCont.defaultPinTheme,
            focusedPinTheme: menualLoginCont.pinputFocus(),
            // errorPinTheme: registerOtpController.pinputError(),
            focusNode: menualLoginCont.pinputFocusNode,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            showCursor: true,
            // onCompleted: (pin) {},
          ),
        ),
      ],
    );
  }
}
