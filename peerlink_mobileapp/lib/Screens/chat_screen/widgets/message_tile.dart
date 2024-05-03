import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/chat_screen/chat_controller.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class MessageTile extends StatelessWidget {
  final Map<String, dynamic> message;
  final bool isGroupMessage;

  const MessageTile(
      {Key? key, required this.message, required this.isGroupMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());

    print(chatController.myId);

    final senderName = message['sender']['username'];
    final content = message['content'];

    final isSentByMe = message['sender']['_id'] == chatController.myId;

    return Row(
      mainAxisAlignment:
          isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  isSentByMe ? AppColor.secondaryColor : AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isGroupMessage
                    ? Text(
                        senderName,
                        style: const TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 12,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  content,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
