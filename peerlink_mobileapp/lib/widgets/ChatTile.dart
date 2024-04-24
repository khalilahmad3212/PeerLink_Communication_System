import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:peerlink_mobileapp/Screens/chat_screen/ChatScreen.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
      title: Text('Hamza'),
      subtitle: Text('kaha ho tum? '),
      // trailing: Text('1:22pm'),
      trailing: const Column(
        children: [
          Text(
            '4:30 PM',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 8,
            ),
            // style: GoogleFonts.getFont(
            //   'Inter',
            //   fontSize: 8,
            //   // color: Colors.red,
            // ),
          ),
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              badgeColor: AppColor.primaryColor,
            ),
            badgeContent: Text(
              '2',
              style: TextStyle(
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
      // dense: true,
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.screen_id);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context)=> ChatScreen(),
        //     )
        // );
      },
    );
  }
}
