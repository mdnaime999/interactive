import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SocalButton extends StatelessWidget {
  SocalButton({super.key, required this.icon, required this.text, this.colors, this.color, required this.onClick});
  final SvgPicture icon;
  final String text;
  final List<Color>? colors;
  final Color? color;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 5.sp),
      decoration: BoxDecoration(
        color: color != null && colors == null ? color! : null,
        gradient: colors != null && color == null
            ? LinearGradient(
                colors: colors!,
              )
            : null,
        borderRadius: BorderRadius.circular(22.sp),
      ),
      child: InkWell(
        onTap: onClick,
        child: Row(
          children: [
            icon,
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
