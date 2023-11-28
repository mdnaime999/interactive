import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:sizer/sizer.dart';

import '../controllers/tab.cont.dart';

class SelectCountry extends StatelessWidget {
  SelectCountry({super.key});
  final HomeTabController tabCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        Country item = countries[index];
        return ListTile(
          onTap: () {
            tabCont.initCountry.value = item;
            tabCont.getStream();
            Get.back();
          },
          leading: Text(
            item.flag,
            style: GoogleFonts.raleway(
              fontSize: 25.sp,
            ),
          ),
          title: Text(item.name),
          subtitle: Text(
            "Code : ${item.code} / Dial Code : +${item.dialCode}",
            style: GoogleFonts.openSans(
              fontSize: 10.sp,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
        height: 1.h,
      ),
    );
  }
}
