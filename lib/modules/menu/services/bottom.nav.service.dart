import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/route/routes.dart';
import '../models/botton.nav.model.dart';

class BottomMenuService extends GetxService {
  Future<BottomMenuService> init() async => this;

  RxInt selectedIndex = 0.obs;
  RxList<MenuModel> items = [
    MenuModel(
      iconPath: "assets/images/svg/icons/menus/home.svg",
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      iconPath: "assets/images/svg/icons/menus/home.svg",
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      iconPath: "assets/images/svg/icons/menus/home.svg",
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      iconPath: "assets/images/svg/icons/menus/home.svg",
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      iconPath: "assets/images/svg/icons/menus/home.svg",
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
  ].obs;

  void buttonAction(int index) {
    print(index);
    selectedIndex.value = index;
    String? toPage = items[index].action;
    if (toPage != null && toPage != "") {
      Get.toNamed(toPage);
    } else {
      Get.snackbar("Page Not Found", "This page is not exist");
    }
  }
}
