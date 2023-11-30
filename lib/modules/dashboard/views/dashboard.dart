import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../config/style.dart';
import '../../drowar/custom.drawer.dart';
import '../../menu/services/bottom.nav.service.dart';
import '../../menu/views/bottom.nav.dart';
import '../controllers/dashboard.cont.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final BottomMenuService menuService = Get.find<BottomMenuService>();
  final DashboardController dashCont = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: homeBackBg,
          child: SafeArea(
            child: Column(
              children: [
                /*------------------------------- logo and drowar ----------------------------*/
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  decoration: BoxDecoration(
                    color: homeBackBg,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 0.1,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 6.w,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          AppStyle().logoSvgAsset,
                        ),
                      ),
                      Text(
                        "Dashboard".toUpperCase(),
                        style: GoogleFonts.raleway(
                          color: Colors.teal.shade800,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          menuService.drawerController.open!();
                        },
                        iconSize: 25.sp,
                        color: Colors.grey,
                        style: IconButton.styleFrom(
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                        ),
                        // padding: EdgeInsets.all(10.sp),
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    controller: dashCont.refreshController.value,
                    enablePullDown: true,
                    enablePullUp: false,
                    onRefresh: dashCont.onReLoad,
                    header: CustomHeader(
                      builder: (BuildContext context, RefreshStatus? mode) {
                        Widget body;
                        if (mode == RefreshStatus.idle) {
                          body = Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.refresh,
                                weight: 500,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Refresh".toUpperCase(),
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        } else {
                          body = LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white,
                            size: 35.sp,
                          );
                        }

                        return Shimmer.fromColors(
                          baseColor: Colors.indigo,
                          highlightColor: Colors.grey,
                          period: Duration(seconds: 2),
                          enabled: true,
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            child: Center(child: body),
                          ),
                        );
                      },
                    ),
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast)),
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      itemCount: dashCont.allPlaylist.length,
                      itemBuilder: (context, index) {
                        Playlist item = dashCont.allPlaylist[index];
                        return Card(
                          child: ListTile(
                            leading: Image(image: CachedNetworkImageProvider(item.thumbnails.highResUrl)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavMenu(),
      ),
    );
  }
}
