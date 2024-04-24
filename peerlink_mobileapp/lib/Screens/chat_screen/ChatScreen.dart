import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peerlink_mobileapp/Screens/instructor_info_screen/InstructorInfoScreen.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const String screen_id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _lastMsgIsRecieved = true;
  int count = 0;
  double _topMarginofTile = 0;
  @override
  Widget build(BuildContext context) {
    print('Hello printing ...... $_lastMsgIsRecieved');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.appbarColor,

        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.secondaryColor,
              ),
              CircleAvatar(
                // radius: 22,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
            ],
          ),
        ),
        leadingWidth: 70,

        title: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, InstructorInfoScreen.screen_id),
          child: Text(
            'Name',
            style: TextStyle(
              fontSize: 24,
              color: AppColor.secondaryColor,
            ),
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: Container(
        //     height: 500,
        //     width: 500,
        //     // padding: const EdgeInsets.only(left: 10),
        //     // color: Colors.red,
        //     child: Icon(
        //       Icons.arrow_back_ios_sharp,
        //     ),
        //   ),
        // ),
        // leading: Container(
        //   color: Colors.red,
        //   margin: EdgeInsets.only(left: 10),
        //   child: Icon(
        //     Icons.arrow_back_ios_sharp,
        //   ),
        // ),

        // title: Container(
        //   color: Colors.green,
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 0),
        //         child: CircleAvatar(
        //           backgroundImage: NetworkImage(
        //               'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 10),
        //         child: Text(
        //           'Name',
        //           style: TextStyle(
        //             fontSize: 24,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        actions: [
          PopupMenuButton(
            icon: Icon(
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
      // body : ListView.separated(
      //
      //   // reverse: true,
      //   itemCount: 20,
      //   // addAutomaticKeepAlives: false,
      //   // cacheExtent: 10,
      //   itemBuilder: (context, index) {
      //     count++;
      //     print('Count : $count');
      //     // if(index % 2 == 0)
      //     if(index%3 == 0 || index%4 == 0)
      //     {
      //       if(_lastMsgIsRecieved){
      //         _topMarginofTile = 10;
      //       }else{
      //         _topMarginofTile = 2;
      //       }
      //       _lastMsgIsRecieved = false;
      //       return SentMessageTile(themeColor2);
      //     }
      //     else{
      //       if(_lastMsgIsRecieved){
      //         _topMarginofTile = 2;
      //       }else{
      //         _topMarginofTile = 10;
      //       }
      //       _lastMsgIsRecieved = true;
      //       return RecievedMessageTile(themeColor1);
      //     }
      //   },
      //   separatorBuilder: (context, index) => SizedBox(height: 20,),
      // ),

      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 60,
          ),
          // reverse: true,
          itemCount: 20,
          // addAutomaticKeepAlives: false,
          // cacheExtent: 10,
          itemBuilder: (context, index) {
            count++;
            print('Count : $count  ,  Index : $index');

            // if(index % 2 == 0)
            if (index % 3 == 0 || index % 4 == 0) {
              if (_lastMsgIsRecieved) {
                // _topMarginofTile = 10;
                _lastMsgIsRecieved = false;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SentMessageTile(AppColor.secondaryColor),
                  ],
                );
              } else {
                // _topMarginofTile = 2;
                _lastMsgIsRecieved = false;
                return Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    SentMessageTile(AppColor.secondaryColor),
                  ],
                );
              }
              // _lastMsgIsRecieved = false;
              // return SentMessageTile(themeColor2);
            } else {
              if (_lastMsgIsRecieved) {
                // _topMarginofTile = 2;
                _lastMsgIsRecieved = true;
                return Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    RecievedMessageTile(AppColor.primaryColor),
                  ],
                );
              } else {
                // _topMarginofTile = 10;
                _lastMsgIsRecieved = true;
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RecievedMessageTile(AppColor.primaryColor),
                  ],
                );
              }
              // _lastMsgIsRecieved = true;
              // return RecievedMessageTile(themeColor1);
            }
            // return (index % 3 == 0)
            //     ? SentMessageTile(themeColor2)
            //     : RecievedMessageTile(themeColor1);

            // return SentMessageTile(themeColor2);
            // return RecievedMessageTile(themeColor1);
          },
        ),
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
              margin: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: AppColor.appbarColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    // spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(4, 4),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIconColor: AppColor.secondaryColor,
                  suffixIconColor: AppColor.secondaryColor,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.emoji_emotions_rounded),
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
                        child: Icon(
                          Icons.attachment,
                          size: 28,
                        ),
                      ),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.only(right: 10),
                    //   child: SvgPicture.asset('assets/icons/attachment.svg'),
                    // ),
                    // child: Icon(),
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Attachment Clicked!');
                    },
                  ),
                  suffixIconConstraints: BoxConstraints(
                      // maxHeight: double.infinity,
                      // maxWidth: double.infinity,
                      ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  // height: 0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Sent Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                foregroundColor: AppColor.primaryColor,
                backgroundColor: AppColor.appbarColor,
              ),
              child: Icon(
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

  Row SentMessageTile(Color themeColor2) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('--------------------------------------------');
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
      _lastMsgIsRecieved = false;
      print(" In sentTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
    });
    // EdgeInsets messageTileMargin;
    // if (_lastMsgIsRecieved) {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 10, bottom: 0);
    // } else {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 80, right: 5, top: 2, bottom: 0);
    // }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            // margin: messageTileMargin,

            // margin: _lastMsgIsRecieved
            //     ? EdgeInsets.only(left: 80, right: 5, top: 10, bottom: 0)
            //     : EdgeInsets.only(left: 80, right: 5, top: 2, bottom: 0),

            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

            // margin: EdgeInsets.only(left: 80, right: 5, top: _topMarginofTile, bottom: 0),
            margin: EdgeInsets.only(left: 80, right: 5, top: 0, bottom: 0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeColor2,
            ),
            child: Text(
              'swqd a asdad asd a s',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row RecievedMessageTile(Color themeColor1) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('----------------------------------------------------');
      print(" In RecieveTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
      _lastMsgIsRecieved = true;
      print(" In RecieveTile , lastMsgIsRecieved : $_lastMsgIsRecieved");
    });
    // EdgeInsets messageTileMargin;
    // if (_lastMsgIsRecieved) {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 5, right: 80, top: 2, bottom: 0);
    // } else {
    //   messageTileMargin =
    //       EdgeInsets.only(left: 5, right: 80, top: 10, bottom: 0);
    // }
    return Row(
      children: [
        Flexible(
          child: Container(
            // margin: messageTileMargin,
            // margin: _lastMsgIsRecieved
            //     ? EdgeInsets.only(left: 5, right: 80, top: 2, bottom: 0)
            //     : EdgeInsets.only(left: 5, right: 80, top: 10, bottom: 0),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // margin: EdgeInsets.only(left: 5, right: 80, top: _topMarginofTile, bottom: 0),
            margin: EdgeInsets.only(left: 5, right: 80, top: 0, bottom: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeColor1,
            ),
            child: Text(
              'swqd a sdad asdasdsaa asdbsdsakbda dsa sda dajdald lasjdlwihaasdhasd dna sdasdaodjnas sasdasdasda',
              style: TextStyle(
                // backgroundColor: themeColor1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
