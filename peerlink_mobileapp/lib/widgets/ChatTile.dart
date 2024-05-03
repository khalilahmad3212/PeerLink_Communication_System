import 'package:flutter/material.dart';

import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadMessages;
  final VoidCallback onTap;

  const ChatTile({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadMessages,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage:
            NetworkImage('https://via.placeholder.com/200x200.png'),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lastMessageTime),
          if (unreadMessages > 0)
            CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              radius: 10,
              child: Text(
                unreadMessages.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
