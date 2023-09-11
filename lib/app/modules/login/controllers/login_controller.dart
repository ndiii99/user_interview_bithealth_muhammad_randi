import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:user_interview_bithealth_muhammad_randi/app/routes/app_pages.dart';

import '../../../config/api.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  void toggle() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      print(Api.login);
      try {
        final res = await http.post(
          Uri.parse(Api.login),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'email': emailController.text,
            'password': passController.text,
          }),
        );
        var response = json.decode(res.body);
        print(response);
        if (res.statusCode == 200) {
          Get.offAllNamed(Routes.HOME);
          DInfo.dialogSuccess('Success');
          DInfo.closeDialog();
        } else {
          DInfo.dialogError(response['error']);
          DInfo.closeDialog();
        }
      } on Exception catch (e) {
        DInfo.dialogError(e.toString());
        DInfo.closeDialog();
      }
      isLoading.value = false;
    } else {
      DInfo.dialogError('Harap Lengkapi Inputan');
    }
  }
}
