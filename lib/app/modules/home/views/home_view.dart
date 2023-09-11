import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:user_interview_bithealth_muhammad_randi/app/config/Text.dart';
import 'package:user_interview_bithealth_muhammad_randi/app/config/app_color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColor.bg,
            body: Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.foundUser.value.length,
                itemBuilder: (context, index) {
                  final item = controller.foundUser.value[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          ClipOval(
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                  title: 'Photo',
                                  content: Container(
                                    width: 400,
                                    height: 400,
                                    color: Colors.white,
                                    child: PhotoView(
                                      imageProvider:
                                          NetworkImage("${item.avatar}"),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.white,
                                child: Image.network(
                                  "${item.avatar}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Full Name ",
                                        style: TextStyling.text2),
                                    Text(": ", style: TextStyling.text2),
                                    Text("${item.firstName} ${item.lastName}",
                                        style: TextStyling.text2,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email ", style: TextStyling.text2),
                                    SizedBox(
                                      width: 32,
                                    ),
                                    Text(": ", style: TextStyling.text2),
                                    Expanded(
                                      child: Text(
                                        "${item.email}",
                                        style: TextStyling.text2,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
