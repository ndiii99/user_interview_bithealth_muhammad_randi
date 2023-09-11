import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_interview_bithealth_muhammad_randi/app/config/Text.dart';
import 'package:user_interview_bithealth_muhammad_randi/app/config/app_color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    var maxheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 20),
                child: const Text(
                  "Welcome",
                  style: TextStyling.text4,
                ),
              ),
              Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SizedBox(
                    height: maxheight * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyling.text1,
                            ),
                            TextFormField(
                              controller: controller.emailController,
                              validator: (value) =>
                                  value == '' ? 'Tidak Boleh Kosong' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.person,
                                  color: AppColor.text1,
                                ),
                                filled: true,
                                fillColor: AppColor.fieldbg,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: AppColor.fieldbg),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: AppColor.fieldbg),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              style: TextStyling.text1,
                            ),
                            Obx(
                              () => TextFormField(
                                obscureText: controller.isPasswordHidden.value,
                                controller: controller.passController,
                                validator: (value) =>
                                    value == '' ? 'Tidak Boleh Kosong' : null,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    child: Obx(
                                      // ignore: prefer_const_constructors
                                      () => Icon(
                                        controller.isPasswordHidden.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColor.text1,
                                      ),
                                    ),
                                    onTap: () {
                                      controller.toggle();
                                    },
                                  ),
                                  filled: true,
                                  fillColor: AppColor.fieldbg,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: AppColor.fieldbg),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: AppColor.fieldbg),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: maxheight * 0.075,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Obx(() {
                  return InkWell(
                    onTap: controller.isLoading.value
                        ? null
                        : () => controller.login(),
                    child: Container(
                      height: 55,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: AppColor.btn,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CircularProgressIndicator(),
                                  Text('Loading...', style: TextStyling.text3),
                                ],
                              )
                            : const Text(
                                'LOGIN',
                                style: TextStyling.text3,
                              ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
