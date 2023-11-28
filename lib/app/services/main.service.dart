import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/firebase_options.dart';
import '../../modules/menu/services/bottom.nav.service.dart';
import 'auth/auth.service.dart';
import 'database/database.service.dart';
import 'database/store.service.dart';

class MainServices {
  Future index() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await GetStorage.init('store');
    await openDatabase();
    await openServices();
  }

  Future<void> openServices() async {
    await Get.putAsync(() => StoreService().init());
    await Get.putAsync(() => AuthService().init());
    await Get.putAsync(() => DatabaseService().init());
    await Get.putAsync(() => BottomMenuService().init());
  }

  Future<void> openDatabase() async {}
}
