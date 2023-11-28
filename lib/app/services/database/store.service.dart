import 'package:get/get.dart';

import '../../common/models/auth.model.dart';
import '../../common/models/socal.model.dart';

class StoreService extends GetxService {
  Future<StoreService> init() async => this;

  Rx<MSocal> socalUser = MSocal().obs;
  Rx<MAutnUser> authUser = MAutnUser().obs;

  // ---- Firebase ----
  RxString fcmToken = "".obs;
}
