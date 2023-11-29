import 'package:get/get.dart';

import '../../../app/middlewares/auth/auth.middleware.dart';
import '../controllers/dashboard.cont.dart';
import '../views/dashboard.dart';

class DashboardRoutes {
  static String dashboard = "/dashboard";

  static List<GetPage> routes = [
    GetPage(
      name: dashboard,
      page: () => Dashboard(),
      bindings: [
        DashboardBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
