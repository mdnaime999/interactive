import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/services/main.service.dart';
import 'app/translation/traslation.dart';
import 'config/config.dart';
import 'modules/home/route/routes.dart';
import 'routes/routings.dart';

void main() async {
  await MainServices().index();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        jointRoute(); // --- inportent ---
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          translations: MyTranslations(),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          initialBinding: HomeBindings(),
          initialRoute: HomeRoutes.home,
          getPages: routes,
          theme: ThemeData(primarySwatch: Colors.red),
          // navigatorObservers: [
          //   FlutterSmartDialog.observer
          // ],
          // builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
