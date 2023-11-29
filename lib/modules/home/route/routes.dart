import 'package:get/get.dart';
import '../controllers/home.cont.dart';
import '../controllers/tab.cont.dart';
import '../views/home.view.dart';

class HomeRoutes {
  static String home = "/";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
      bindings: [
        HomeBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [
      //   AuthGuard(),
      // ],
    ),
  ];
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeTabController>(() => HomeTabController());
  }
}
