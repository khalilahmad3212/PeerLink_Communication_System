import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/profile_screen.dart/profile_controller.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.appbarColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  AppColor.cardShadow,
                ],
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColor.secondaryColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => CircleAvatar(
                              backgroundImage: NetworkImage(
                                profileController.avatar.toString(),
                              ),
                              radius: 80, // Set the radius as needed
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Text(
                              profileController.myUsername.toString(),
                              style: const TextStyle(
                                color: AppColor.secondaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                padding:
                    const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 30),
                // height: 200,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: AppColor.appbarColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    AppColor.cardShadow,
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'INFORMATION',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Designation:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Email:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Department:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Created At:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                                profileController.myUserId.value.toString())),
                            Obx(() =>
                                Text(profileController.role.value.toString())),
                            Obx(() =>
                                Text(profileController.email.value.toString())),
                            const Text('Computer Science'),
                            Obx(() => Text(
                                profileController.createdAt.value.toString())),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => profileController.role == 'TEACHER'
                  ? Container(
                      padding: const EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 30),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: AppColor.appbarColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          AppColor.cardShadow,
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'CONSULTANT HOURS',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // itemCount: 3,
                            itemCount:
                                profileController.consultancyHours.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${profileController.consultancyHours.keys.elementAt(index)} =>",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(profileController
                                          .consultancyHours.values
                                          .elementAt(index)),
                                      const Spacer(),
                                      const Icon(
                                        Icons.send_rounded,
                                        color: AppColor.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
