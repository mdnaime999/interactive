import 'package:get/get.dart';

import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/store.service.dart';

class HomeController extends GetxController {
  final store = Get.find<StoreService>();
  final authService = Get.find<AuthService>();
}
