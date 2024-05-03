import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/chat_screen/chat_controller.dart';
import 'package:peerlink_mobileapp/Screens/chat_screen/widgets/message_tile.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int count = 0;
  final double _topMarginofTile = 0;
  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    chatController.getMyId();
    final myArgs = Get.arguments;
    chatController.fetchMessages(myArgs['chatId']);
    chatController.isGroupChat.value = myArgs['isGroupChat'];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.appbarColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            chatController.update();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.secondaryColor,
              ),
              CircleAvatar(
                // radius: 22,
                backgroundImage: NetworkImage(myArgs['avatar'] ?? ''),
              ),
            ],
          ),
        ),
        leadingWidth: 70,
        title: GestureDetector(
          onTap: () {
            myArgs['isGroupChat'] == true
                ? Get.toNamed(
                    RouteName.groupInfoScreen,
                    arguments: myArgs,
                  )
                : Get.toNamed(
                    RouteName.chatInfoScreen,
                    arguments: myArgs,
                  );
          },
          child: Text(
            myArgs['name'] ?? 'Name',
            style: const TextStyle(
              fontSize: 24,
              color: AppColor.secondaryColor,
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: AppColor.secondaryColor,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: '1',
                child: Text('option 1'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 2'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 3'),
              ),
            ],
          ),
        ],
      ),
      body: Obx(
        () {
          if (chatController.loading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatController.chatMessages.length,
                    itemBuilder: (context, index) {
                      final message = chatController.chatMessages[
                          (chatController.chatMessages.length - 1) - index];
                      return MessageTile(
                        message: message,
                        isGroupMessage: chatController.isGroupChat.value,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 55),
              ],
            );
          }
        },
      ),
      bottomSheet: Container(
        // margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: AppColor.appbarColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    // spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(4, 4),
                  )
                ],
              ),
              child: TextField(
                controller: chatController.messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIconColor: AppColor.secondaryColor,
                  suffixIconColor: AppColor.secondaryColor,
                  prefixIcon: GestureDetector(
                    child: const Icon(Icons.emoji_emotions_rounded),
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Emoji Icon Pressed');
                    },
                  ),
                  hintText: 'Messaage',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 20,
                  ),
                  suffixIcon: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Transform.rotate(
                        angle: -135 * (3.14159265359 / 180),
                        child: const Icon(
                          Icons.attachment,
                          size: 28,
                        ),
                      ),
                    ),
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Attachment Clicked!');
                    },
                  ),
                  suffixIconConstraints: const BoxConstraints(
                      // maxHeight: double.infinity,
                      // maxWidth: double.infinity,
                      ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                  // height: 0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Sent Button Clicked');
                if (chatController.messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                      myArgs['chatId'], chatController.messageController.text);
                  chatController.messageController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                foregroundColor: AppColor.primaryColor,
                backgroundColor: AppColor.appbarColor,
              ),
              child: const Icon(
                Icons.send,
                color: AppColor.secondaryColor, // Icon color
                size: 30, // Icon size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
