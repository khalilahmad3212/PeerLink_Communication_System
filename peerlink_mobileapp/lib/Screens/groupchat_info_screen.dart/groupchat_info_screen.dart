import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:peerlink_mobileapp/Screens/chat_screen/chat_controller.dart';
// import 'package:peerlink_mobileapp/Screens/profile_screen.dart/profile_controller.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class GroupInfoScreen extends StatefulWidget {
  const GroupInfoScreen({super.key});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfoScreen> {
  final myArgs = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // ProfileController profileController = Get.put(ProfileController());
    // ChatController chatController = Get.put(ChatController());

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
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              myArgs['avatar'] ?? '',
                            ),
                            radius: 80, // Set the radius as needed
                          ),
                          const SizedBox(height: 10),
                          Text(
                            myArgs['name'] ?? 'No Name',
                            style: const TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
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
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 30),
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
                              'Group Id:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Group Created At:   ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myArgs['chatId'] ?? 'No Chat Id'),
                            Text(myArgs['createdAt'] ?? 'No Created At'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 30),
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
                        'MEMBERS',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Group Admin:   ',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              myArgs['participants'][myArgs['participants']
                                  .indexWhere((participant) =>
                                      participant['_id'] ==
                                      myArgs['adminId'])]['avatar']['url'],
                            ),
                          ),
                          title: Text(myArgs['participants'][
                                  myArgs['participants'].indexWhere(
                                      (participant) =>
                                          participant['_id'] ==
                                          myArgs['adminId'])]['username'] ??
                              'No Admin Name'),
                          subtitle: Text(myArgs['participants'][
                                  myArgs['participants'].indexWhere(
                                      (participant) =>
                                          participant['_id'] ==
                                          myArgs['adminId'])]['email'] ??
                              'No Admin Email'),
                        ),
                        const Text(
                          'Group Members:   ',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: myArgs['participants'].length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  myArgs['participants'][index]['avatar']
                                      ['url'],
                                ),
                              ),
                              title: Text(myArgs['participants'][index]
                                      ['username'] ??
                                  'No Member Name'),
                              subtitle: Text(myArgs['participants'][index]
                                      ['email'] ??
                                  'No Member Email'),
                              trailing: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 2,
                                    color: AppColor.primaryColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Text(
                                  'Remove',
                                  style:
                                      TextStyle(color: AppColor.primaryColor),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    AppColor.whiteColor),
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColor.primaryColor)),
                            child: const Text('Add Member'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
