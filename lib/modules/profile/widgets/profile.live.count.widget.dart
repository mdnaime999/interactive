import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/style.dart';

class ProfileLiveCount extends StatelessWidget {
  const ProfileLiveCount({
    super.key,
    this.color,
    this.style,
    this.tittle,
    this.tittle1,
    this.decoration,
    this.image,
  });
  final String? tittle;
  final String? tittle1;
  final TextStyle? style;
  final Color? color;
  final Decoration? decoration;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ?? homeStatusBg,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
        child: Row(
          children: [
            SvgPicture.asset(
              image ?? "",
              width: 5.w,
            ),
            SizedBox(width: 2.w),
            Text(
              tittle1 ?? "",
              style: style ??
                  GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(width: 1.w),
            Text(
              tittle ?? "",
              style: style ??
                  GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
