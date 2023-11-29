// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
import 'package:stack_trace/stack_trace.dart';

import '../../../config/api.dart';
import '../../../modules/auth/route/routes.dart';
import '../../../modules/dashboard/models/stream.model.dart';
import '../../common/models/auth.model.dart';
import '../../common/models/http.headers.dart';
import '../auth/auth.service.dart';
import 'store.service.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async => this;

  final store = Get.find<StoreService>();
  final authService = Get.find<AuthService>();

  static var client = http.Client();
  Api api = Api();

  // Authontication
  Future<void> handleGetContact(GoogleSignInAccount user) async {
    await user.authHeaders.then((userAuth) async {
      print(userAuth);
      final http.Response response = await http.get(
        Uri.parse('https://people.googleapis.com/v1/people/me?personFields=phoneNumbers,emailAddresses,names,addresses,photos'),
        headers: userAuth,
      );
      dev.log(response.body);
      if (response.statusCode != 200) {
        final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
        dev.log(data.toString());
      }
    });
    // final Map<String, dynamic> data =
    //     json.decode(response.body) as Map<String, dynamic>;
    // final String? namedContact = _pickFirstNamedContact(data);
  }

  Future<MAutnUser?> socalLoginApi(Map sendBody) async {
    Uri uri = api.generateApi(api.socialLogin);
    var responce = await client.post(uri, body: sendBody);
    // dev.log(responce.body);
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      responce.statusCode == 201 ? authService.firstOpen.value = true : authService.firstOpen.value = false;
      var jsonGet = jsonDecode(responce.body);
      MAutnUser authUser = MAutnUser.fromJson(jsonGet);
      store.authUser.value = authUser;
      return authUser;
    } else {
      print(errorHandle("socalLoginApi", responce.statusCode.toString()));
      return null;
    }
  }

  // ----------------------------------- Stream Api
  Future<List<MStream>?> getStreamListApi(Map sendBody, HttpHeaderApi headers) async {
    Uri uri = api.generateApi(api.liveStreamsList);
    var responce = await client.post(uri, body: jsonEncode(sendBody), headers: headers.toJson());
    if (responce.statusCode == 200) {
      List<MStream> jsonGet = mStreamFromJson(responce.body);
      return jsonGet;
    } else {
      print(errorHandle("getStreamListApi", responce.statusCode.toString()));
      return null;
    }
  }
  // ----------------------------------- Error Handle

  String errorHandle(String mathordName, String statusCode) {
    Map returnData = {};
    returnData['page'] = Frame.caller(1).uri.path;
    returnData['mathordName'] = mathordName;
    returnData['statusCode'] = statusCode;

    return jsonEncode(returnData);
  }

  Future getStreamApi(Map sendBody) async {
    Api api = Api();
    Uri uri = api.generateApi(api.liveStreamsList);
    var responce = await client.post(uri, body: sendBody);
    // dev.log(responce.body);
    if (responce.statusCode == 200) {
      var jsonGet = jsonDecode(responce.body);
      return jsonGet;
    } else {
      print(errorHandle("getStreamApi", responce.statusCode.toString()));
    }
  }
}
