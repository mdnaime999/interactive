import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/database.service.dart';
import '../../../app/services/database/store.service.dart';
import '../../../config/dialogs/sample.dialog.dart';
import '../../../config/style.dart';
import '../../dashboard/models/stream.model.dart';
import '../models/tab.model.dart';
import '../widgets/country.widget.dart';

class HomeTabController extends GetxController {
  final store = Get.find<StoreService>();
  final as = Get.find<AuthService>();
  final dbs = Get.find<DatabaseService>();

  RxInt selectedTab = 0.obs;
  RxString selectedTabAction = "populer".obs;
  RxList<TabModel> tabList = <TabModel>[].obs;
  Rx<Country> initCountry = countries[18].obs;
  RxString selectedContry = "".obs;

  RxBool loading = false.obs;
  RxList<MStream> streamList = <MStream>[].obs;
  @override
  void onInit() {
    loadTab();
    getStream();
    super.onInit();
  }

  void loadTab() {
    tabList.clear();
    for (TabModel tabData in tabListData) {
      tabList.add(tabData);
    }
  }

  void tabAction(int index) async {
    selectedTab.value = index;
    TabModel st = tabList[index];
    if (st.action != null && st.action != "") {
      selectedTabAction.value = st.action!;
      await getStream();
    }
  }

  void changeCountry() async {
    Get.dialog(
      SampleDialog(
        title: Text(
          "Select Country",
          style: dialogTittleStyle,
        ),
        body: SelectCountry(),
      ),
    );
  }

  Future<void> getStream() async {
    loading.value = true;
    Map sendData = {};
    sendData["country"] = selectedContry.value;
    sendData["filter"] = selectedTabAction.value;
    await dbs.getStreamListApi(sendData, as.headers.value).then((returnData) {
      if (returnData != null && returnData.isNotEmpty) {
        streamList.clear();
        for (MStream stream in returnData) {
          streamList.add(stream);
          // print(stream.toJson());
        }
        loading.value = false;
      } else {
        streamList.clear();
        loading.value = false;
      }
    });
  }
}
