import 'package:get/get.dart';

import '../config/config.dart';

List<GetPage> routes = [];

void jointRoute() {
  for (List<GetPage<dynamic>> module in modules) {
    for (GetPage route in module) {
      routes.add(route);
    }
  }
}
