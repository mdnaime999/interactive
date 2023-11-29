// ignore_for_file: deprecated_member_use

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/bottom.nav.service.dart';

class BottomNavMenu extends StatelessWidget {
  BottomNavMenu({super.key});
  final bms = Get.find<BottomMenuService>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavyBar(
        selectedIndex: bms.selectedIndex.value,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) {
          bms.buttonAction(index);
          // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: bms.items
            .map(
              (menu) => BottomNavyBarItem(
                icon: menu.icon!,
                title: Text(menu.title!),
                activeColor: menu.activeColor!,
                inactiveColor: menu.inactiveColor ?? Colors.grey.shade300,
                textAlign: TextAlign.center,
              ),
            )
            .toList(),
      );
    });
  }
}
