import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../config/dialogs/body.dialog.dart';
import '../../drowar/models/drawer.menu.model.dart';
import '../../home/route/routes.dart';
import '../../profile/route/routes.dart';
import '../models/botton.nav.model.dart';

class BottomMenuService extends GetxService {
  Future<BottomMenuService> init() async => this;
  final ZoomDrawerController drawerController = ZoomDrawerController();

  RxInt selectedIndex = 0.obs;
  RxList<MenuModel> items = [
    MenuModel(
      icon: Icon(Icons.home),
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      icon: Icon(Icons.home),
      title: "Home",
      action: HomeRoutes.home,
      activeColor: Colors.indigo,
      inactiveColor: Colors.grey,
    ),
    MenuModel(
      icon: Icon(Icons.home),
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

  RxList<MDrawerMenu> drawerMenuList = [
    MDrawerMenu(
      icon: Icons.dashboard,
      title: "Dashboard",
      action: () {},
      clicked: false.obs,
    ),
    MDrawerMenu(
      icon: FaIcon(FontAwesomeIcons.user).icon,
      title: "Profile",
      action: () {
        Get.dialog(
          ShowDialogWithBody(
            title: "Attention !!!",
            body: Text("You are not logged in,\nDo you want to login to the app?"),
            submitText: "Yes",
            submitFun: () {
              Get.toNamed(ProfileRoutes.userProfile);
            },
            cancelText: "No",
            cancelFun: () {
              Get.back();
            },
          ),
        );
      },
      clicked: false.obs,
    ),
    MDrawerMenu(
      icon: Icons.settings_outlined,
      title: "Settings",
      action: () {},
      clicked: false.obs,
    ),
  ].obs;
}
