import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// App
const appThemeColor = Colors.indigo;

Color drawerBg = Colors.blue.shade300;

class AppStyle {
  String companyName = "Interactive Cares";
  String logoSvgAsset = 'assets/images/svg/logo.svg';
}

// Field
class FieldStyle {
  Color borderColor = Color(0xFFFFBC3A);
  BoxDecoration decorationOne = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(15.sp),
  );
}

// input search field
// Color borderColor = Color(0xFFFFBC3A);
BoxDecoration decorationSearch = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(40.sp),
);

// Login Page
class LoginStyle {
  BoxDecoration loginBack = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white,
        Colors.teal,
      ],
    ),
  );
  Color logoBg = Colors.white;

  BoxDecoration loginButton = BoxDecoration(
    borderRadius: BorderRadius.circular(15.sp),
    border: Border.all(color: Colors.white),
    gradient: LinearGradient(
      colors: [
        Colors.teal.shade200,
        Colors.teal.shade700,
      ],
    ),
  );

  BoxDecoration regButton = BoxDecoration(
    borderRadius: BorderRadius.circular(15.sp),
    border: Border.all(color: Colors.white),
    gradient: LinearGradient(
      colors: [
        Colors.teal.shade700,
        Colors.teal.shade200,
      ],
    ),
  );

  String loginText1 = "User Login";
  TextStyle loginTextStyle = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  String loginText2 = "Login Means You Agree Our Terms & Condition?";
  TextStyle loginTextStyle2 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 12.sp,
  );

  String loginText3 = "Account";
  String loginText4 = "Enter your account and password";
  String loginText5 = "Enter Your Mobile Number";

  TextStyle loginTextStyle3 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  TextStyle loginTextStyle4 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 12.sp,
  );

  String facebookLogo = 'assets/images/svg/socal/facebook.svg';
  List<Color> facebookButtonBg = [
    Color(0xFF1977F2),
    Color(0xFF2282FF),
  ];
  String googleLogo = 'assets/images/svg/socal/google.svg';
  List<Color> googleButtonBg = [
    Color(0xFFE33E2B),
    Color(0xFFE33E2B),
  ];
  String twitterLogo = 'assets/images/svg/socal/twitter.svg';
  List<Color> twitterButtonBg = [
    Color(0xFF111111),
    Color(0xFF111111),
  ];
  String moreVartCircle = 'assets/images/svg/more.vart.svg';
  String phoneCircle = 'assets/images/svg/phone.svg';
  String userCircle = 'assets/images/svg/user.svg';
}

// Dialog Style
BoxDecoration sampleDialogeback = BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp),
  gradient: LinearGradient(
    colors: [
      Color(0xFF69E0E5),
      Color(0xFF0F4EB0),
    ],
  ),
);
BoxDecoration dialogSubmitBtn = BoxDecoration(
  // color: Color(0xFF9754F7),
  borderRadius: BorderRadius.circular(8),
  gradient: LinearGradient(
    colors: [
      Color(0xFF9754F7),
      Color(0xFF4912EA),
    ],
  ),
);
TextStyle dialogTittleStyle = GoogleFonts.inter(
  fontSize: 14.sp,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
final dilogBodyDecoration = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.only(
    // topLeft: Radius.circular(30.sp),
    topRight: Radius.circular(30.sp),
  ),
);

final dilogSaveButtonColor = [
  appThemeColor,
  HSLColor.fromColor(appThemeColor).withLightness(0.7).toColor(),
];
final dilogCancelButtonColor = [
  Colors.grey.shade700,
  Colors.grey,
];

final dilogBottomDecoration = BoxDecoration(
  color: Color(0xFFFFFFFF),
  border: Border(top: BorderSide(color: Colors.grey)),
);

/*-------------------------------- Home Page Style ---------------------------------*/

Color homeBackBg = Color(0xFFF2FBFF);
BoxDecoration homeStatusBg = BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp),
);
BoxDecoration homeStatusBgLive = BoxDecoration(
  // color: Color(0xFF9754F7),
  borderRadius: BorderRadius.circular(10.sp),
  gradient: LinearGradient(
    colors: [
      // Color(0x9FFFFFFF),
      Color(0x9F9351F6),
      Color(0x9F4B13E9),
    ],
  ),
);
BoxDecoration homeStatusBgLivegPoint = BoxDecoration(
  // color: Color(0xFF9754F7),
  borderRadius: BorderRadius.circular(10.sp),
  gradient: LinearGradient(
    colors: [
      // Color(0x9FFFFFFF),
      Color(0xACC4A4A4),
      Color.fromRGBO(255, 255, 255, 0.608),
    ],
  ),
);
String homeToffeCup = 'assets/images/svg/socal/facebook.svg';
String flag = 'assets/images/svg/flag.svg';
String statusimage1 = 'assets/images/svg/statusIcon1.png';
String statusimage2 = 'assets/images/svg/statusIcon2.png';

/*-------------------------------- Icons ---------------------------------*/
String camera = 'assets/images/svg/icons/camera.svg';

/*-------------------------------- User Deatails set ---------------------------------*/
Color profilepicBack = Color(0xFFF2FBFF);
BoxDecoration profileSaveBtn = BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp),
  gradient: LinearGradient(
    colors: [
      Color(0xFF9754F7),
      Color(0xFF4912EA),
    ],
  ),
);
/*-------------------------------- Home Page Style ---------------------------------*/
BoxDecoration userProfileTopBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF9754F7),
      Color(0xFF4912EA),
    ],
  ),
);
BoxDecoration profileliveBg = BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp),
  color: Color(0xFF0FF04E),
);
BoxDecoration profiledtarnd = BoxDecoration(
  borderRadius: BorderRadius.circular(10.sp),
  color: Color(0xFFCE4EFB),
);
