import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:user_interview_bithealth_muhammad_randi/app/config/api.dart';
import 'package:user_interview_bithealth_muhammad_randi/app/data/model/userModel.dart';

class HomeController extends GetxController {
  Rx<List<UserDataModel>> foundUser = Rx<List<UserDataModel>>([]);

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future fetchUserData() async {
    try {
      final res = await http.get(Uri.parse(Api.listUser));
      var response = json.decode(res.body);
      if (res.statusCode != 200) {
        DInfo.dialogError('Error Load Data');
        DInfo.closeDialog();
      } else {
        List<dynamic> json = response['data'];
        for (var o in json) {
          foundUser.value.add(UserDataModel.fromJson(o));
        }
        update();
      }
    } on Exception catch (e) {
      DInfo.dialogError('Failed Load Data');
      DInfo.closeDialog();
    }
  }
}
