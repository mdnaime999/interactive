import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../style.dart';

class ShowDialogWithBody extends StatelessWidget {
  ShowDialogWithBody({
    Key? key,
    this.title,
    required this.body,
    this.onlyBody = false,
    this.submitText,
    this.submitFun,
    this.cancelText,
    this.cancelFun,
    this.obx = false,
  }) : super(key: key);

  final String? title;
  final Widget body;
  final bool onlyBody;
  final String? submitText;
  final Function()? submitFun;
  final String? cancelText;
  final Function()? cancelFun;
  final bool obx;

  @override
  Widget build(BuildContext context) {
    return onlyBody
        ? body
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              child: SizedBox(
                height: 100.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        gradient: LinearGradient(colors: [
                          Colors.amber,
                          Colors.amber.shade800,
                        ]),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                              child: Text(
                                title ?? "Dialog Title",
                                // style: dilogHeaderText,
                              ),
                            ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 5.h),
                            child: AnimatedContainer(
                              width: 100.w,
                              duration: Duration(seconds: 1),
                              padding: obx != true ? EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.sp) : EdgeInsets.zero,
                              decoration: dilogBodyDecoration,
                              child: body,
                            ),
                          ),
                          if (obx != true)
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.all(10.sp),
                              decoration: dilogBottomDecoration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (submitFun != null)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(colors: dilogSaveButtonColor),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: const Color.fromARGB(255, 187, 152, 152),
                                          padding: EdgeInsets.symmetric(vertical: 12.sp),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        onPressed: submitFun,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                                          child: Text(
                                            submitText ?? "Conform",
                                            style: GoogleFonts.radley(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (submitFun != null) SizedBox(width: 10.sp),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(colors: dilogCancelButtonColor),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(vertical: 12.sp),
                                        visualDensity: VisualDensity.compact,
                                      ),
                                      onPressed: cancelFun ?? () => Get.back(),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                                        child: Text(
                                          cancelText ?? "Cancel",
                                          style: GoogleFonts.radley(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
