import 'package:get/get.dart';

import '../views/profile.set.dart';
import '../controllers/auth.cont.dart';
import '../controllers/menual.login.cont.dart';
import '../controllers/profile.first.cont.dart';
import '../views/menual.login.dart';
import '../views/login.view.dart';

class AuthRoutes {
  static String login = "/login";
  static String menualLogin = "/menualLogin";
  static String profileset = "/profileset";

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => LoginView(),
      bindings: [
        HomeBindings(),
        MenualBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [AuthGuard()],
    ),
    GetPage(
      name: menualLogin,
      page: () => MenuaLLoginPage(),
      bindings: [
        MenualBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [AuthGuard()],
    ),
    GetPage(
      name: profileset,
      page: () => ProfileSet(),
      bindings: [
        ProfileFirstBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [ AuthGuard()],
    ),
  ];
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

class MenualBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenualLoginController>(() => MenualLoginController());
  }
}

class ProfileFirstBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileFirstController>(() => ProfileFirstController());
  }
}
