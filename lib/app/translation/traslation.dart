import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "dashbord": "Dashboard",
          "logout": "Logout",
          "cancel": "Cancel",
        },
        "bn_BD": {
          "dashbord": "ড্যাশবোর্ড",
          "logout": "প্রস্থান",
          "cancel": "বাতিল",
        },
      };
}
