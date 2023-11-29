import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../app/common/models/enum.model.dart';
import '../../../app/common/widgets/rich.widget.dart';
import '../../dashboard/models/stream.model.dart';
import '../controllers/tab.cont.dart';

class TabContent extends StatelessWidget {
  TabContent({super.key});
  final HomeTabController tabCont = Get.find();
  final List<Color> liveColors = [
    Color(0xFF9851F6),
    Color(0xFF4B13E9)
  ];
  final List<Color> pkColors = [
    Color(0xFFE256AB),
    Color(0xFF895ED9)
  ];
  final List<Color> partyColors = [
    Color(0xFF63C7FF),
    Color(0xFF126BD2)
  ];

  final String liveIcon = "assets/images/svg/icons/live.svg";
  final String partyIcon = "assets/images/svg/icons/party.svg";
  final String topRightIcon = "assets/images/svg/icons/top-right.svg";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!tabCont.loading.value && tabCont.streamList.isNotEmpty) {
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(10.sp),
          physics: NeverScrollableScrollPhysics(),
          itemCount: tabCont.streamList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            MStream item = tabCont.streamList[index];

            List<Color> leftBg = item.liveType == LiveType.LIVE
                ? liveColors
                : item.liveType == LiveType.PK
                    ? pkColors
                    : partyColors;
            String leftIcon = item.liveType == LiveType.LIVE ? liveIcon : partyIcon;

            return GridTile(
              header: Container(
                padding: EdgeInsets.all(5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // -------------------- Top Left
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: leftBg,
                        ),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: CustomRich(
                        first: item.liveType != LiveType.PK ? SvgPicture.asset(leftIcon) : null,
                        secend: Text(
                          liveTypeValues.reverse[item.liveType].toString().capitalize!,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ),
                    // -------------------- Top Right
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.36),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: CustomRich(
                        first: SvgPicture.asset(topRightIcon),
                        secend: Text(
                          item.audienceUids!.length.toString(),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              footer: Container(
                padding: EdgeInsets.all(5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // -------------------- Bottom Left
                    if (item.hostUser != null && item.hostUser!.username != null && item.hostUser!.username != "")
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                        child: Text(
                          item.hostUser!.username!.toLowerCase().capitalize!,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    // -------------------- Bottom Right
                    // if (item.hostUser != null && item.hostUser!.location != null && item.hostUser!.location != "")
                    //   Flexible(
                    //     child: Container(
                    //       padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white.withOpacity(0.40),
                    //         borderRadius: BorderRadius.circular(5.sp),
                    //       ),
                    //       child: CustomRich(
                    //         secend: Text(
                    //           countries.firstWhere((country) => country.code == item.hostUser!.location).name.capitalize!,
                    //           style: GoogleFonts.inter(
                    //             color: Colors.white,
                    //             fontSize: 8.sp,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  // color: Colors.blueAccent,
                  image: DecorationImage(
                    image: AssetImage("assets/images/contentimage.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            );
          },
        );
      } else if (!tabCont.loading.value && tabCont.streamList.isEmpty) {
        return SizedBox(
          height: 50.h,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo, width: 3.sp),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Text(
                "${tabCont.tabList[tabCont.selectedTab.value].title} is not available",
                style: GoogleFonts.inter(
                  color: Colors.indigo,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        );
      } else {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          period: Duration(milliseconds: 2000),
          direction: ShimmerDirection.ltr,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.sp),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.sp,
              crossAxisSpacing: 10.sp,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
