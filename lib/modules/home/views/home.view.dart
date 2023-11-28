import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../app/common/widgets/rich.widget.dart';
import '../../../config/fields/input.field.dart';
import '../../../config/style.dart';
import '../../menu/views/bottom.nav.dart';
import '../controllers/home.cont.dart';
import '../controllers/tab.cont.dart';
import '../widgets/content.widget.dart';
import '../widgets/tab.wisget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeCont = Get.find();
  final HomeTabController tabCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: homeBackBg,
        child: SafeArea(
          child: Column(
            children: [
              /*------------------------------- logo and search bar ----------------------------*/
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => homeCont.authService.signOut(),
                      iconSize: 13.w,
                      visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                      // padding: EdgeInsets.all(10.sp),
                      icon: SvgPicture.asset(
                        homeToffeCup,
                        width: 13.w,
                        height: 13.w,
                      ),
                    ),
                    InputSearchField(
                      prefixIcon: Icon(Icons.search, color: Color(0xFFA7A3A3)),
                      style: GoogleFonts.inter(
                        color: Colors.grey.shade200,
                        fontSize: 12.sp,
                      ),
                      hintText: "Search ID",
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xFFA7A3A3),
                        fontSize: 12.sp,
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                  padding: EdgeInsets.symmetric(vertical: 5.sp),
                  children: [
                    /*-------------------------------Top Tab Bar Button----------------------------*/
                    HomeTab(),
                    SizedBox(height: 2.h),
                    /*------------------------------- CarouselSlider ----------------------------*/
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 16 / 6,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return Container(
                          width: 100.w,
                          margin: EdgeInsets.symmetric(horizontal: 10.sp),
                          decoration: BoxDecoration(color: Color(0xFF70C3FF), borderRadius: BorderRadius.circular(10.sp)),
                          child: Center(
                            child: Text("Test"),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    /*------------------------------- Flag ----------------------------*/
                    Obx(() {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: CustomRich(
                          first: Container(
                            width: 1.5.w,
                            height: 5.h,
                            // margin: EdgeInsets.only(right: 10.sp),
                            decoration: BoxDecoration(
                              color: Color(0xFF9351F6),
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                          ),
                          middle: SizedBox(width: 10.sp),
                          secend: InkWell(
                            onTap: tabCont.changeCountry,
                            child: Text(
                              tabCont.initCountry.value.flag,
                              style: GoogleFonts.raleway(
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    /*------------------------------- Tab Content ----------------------------*/
                    TabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavMenu(),
    );
  }
}
