import 'package:get/get.dart';
import '../views/user.profile.dart';

class ProfileRoutes {
  static String userProfile = "/userProfile";

  static List<GetPage> routes = [
    GetPage(
      name: userProfile,
      page: () => UserProfile(),
      bindings: [],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [AuthGuard()],
    ),
  ];
}
