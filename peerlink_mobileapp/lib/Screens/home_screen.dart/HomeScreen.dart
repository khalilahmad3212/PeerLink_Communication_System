import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/home_screen.dart/home_controller.dart';
import 'package:peerlink_mobileapp/Screens/home_screen.dart/my_custom_time.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/widgets/ChatTile.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  // void toggleFloatingButton() {
  //   setState(() {
  //     isChatTab = !isChatTab;
  //   });
  // }

  @override
  void dispose() {
    _tabController.dispose(); // Don't forget to dispose the controller.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeController.fetchChats();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.appbarColor,
          child: Obx(
            () => Icon(
              homeController.isChatTab.value
                  ? Icons.chat_rounded
                  : Icons.groups,
              color: AppColor.secondaryColor,
              size: 40,
            ),
          ),
          onPressed: () {
            if (homeController.isChatTab.value) {
              Get.toNamed(RouteName.searchUserScreen);
            } else {
              Get.toNamed(RouteName.createGroupChatScreen);
            }
            // Get.toNamed(RouteName.createGroupChatScreen);
          },
        ),
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'PeerLink',
            style: TextStyle(
              color: AppColor.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: AppColor.appbarColor,
          leading: Container(
            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/icons/peerlink_logo.svg',
              ),
            ),
          ),
          actions: [
            // Icon(
            //   Icons.search,
            //   color: AppColor.secondaryColor,
            // ),
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: AppColor.secondaryColor,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: '2',
                  child: GestureDetector(
                    onTap: () => Get.toNamed(RouteName.profileScreen),
                    child: const Text('My Profile'),
                  ),
                ),
                PopupMenuItem(
                  value: '1',
                  child: GestureDetector(
                    onTap: () {
                      UserPreference up = UserPreference();
                      up.removeUser();
                      Get.offAllNamed(RouteName.loginSignupScreen);
                    },
                    child: const Text('Logout'),
                  ),
                ),
                // PopupMenuItem(
                //   value: '2',
                //   child: Text('option 3'),
                // ),
              ],
            ),
          ],

          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.secondaryColor,
            labelColor: AppColor.secondaryColor,
            // isScrollable: true,
            labelStyle: const TextStyle(
              fontSize: 20,
              fontFamily: 'Itim',
              fontWeight: FontWeight.w400,
            ),
            onTap: (index) {
              if ((index == 0 && !(homeController.isChatTab.value)) ||
                  (index == 1 && homeController.isChatTab.value)) {
                homeController.toggleFloatingButton();
              } else if (index == 0 && homeController.isChatTab.value) {
                Fluttertoast.showToast(
                    msg:
                        'Already on Chat Screen ${homeController.isChatTab.value}');
              } else if (index == 1 && !(homeController.isChatTab.value)) {
                Fluttertoast.showToast(msg: 'Already on Peer Groups Screen');
              }
              setState(() {});
              // Fluttertoast.showToast(msg: 'you tapped $index');
            },
            tabs: const [
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Peer Groups",
              ),
            ],
          ),

          // backgroundColor: Color(0xEFA54180),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Obx(
              () => ListView.builder(
                itemCount: homeController.chatList.length,
                itemBuilder: (context, index) {
                  final chat = homeController.chatList[index];
                  final name = chat['participants'][0]['username'] ==
                          homeController.myUsername
                      ? chat['participants'][1]['username']
                      : chat['participants'][0]['username'];
                  // final name = chat['name'];
                  final lastMessage = chat['lastMessage'] != null
                      ? chat['lastMessage']['content']
                      : 'No Messages Yet';
                  final lastMessageTime = chat['lastMessage'] != null
                      ? chat['lastMessage']['createdAt']
                      : '';
                  final unreadMessages = chat['lastMessage'] != null
                      ? chat['lastMessage']['attachments'].length
                      : 0;
                  // final unreadMessages = 2;

                  // Assuming apiLastMessageTime is the timestamp from the API
                  String timeAgo = '';
                  if (lastMessageTime != '') {
                    DateTime lastMsgTime = DateTime.parse(lastMessageTime);

                    // Calculate the time difference
                    Duration difference =
                        DateTime.now().difference(lastMsgTime);

                    timeago.setLocaleMessages('en', MyCustomTime());

                    // Convert the time difference to a human-readable format
                    timeAgo = timeago.format(
                      DateTime.now().subtract(difference),
                    );
                  }

                  // print(
                  //     'Attachments: $unreadMessages, ${chat['lastMessage']['attachments'].length}');
                  print('isGroupChat ${chat['isGroupChat']}');
                  return chat['isGroupChat']
                      ? Container()
                      : ChatTile(
                          name: name,
                          lastMessage: lastMessage,
                          lastMessageTime: timeAgo,
                          unreadMessages: unreadMessages,
                          onTap: () {
                            print('One on One Chat Pressed');
                            Get.toNamed(
                              RouteName.chatScreen,
                              arguments: {
                                'chatId': chat['_id'],
                                'name': name,
                                'email': chat['participants'][0]['username'] ==
                                        homeController.myUsername
                                    ? chat['participants'][1]['email']
                                    : chat['participants'][0]['email'],
                                'role': chat['participants'][0]['username'] ==
                                        homeController.myUsername
                                    ? chat['participants'][1]['role']
                                    : chat['participants'][0]['role'],
                                'avatar': chat['participants'][0]['username'] ==
                                        homeController.myUsername
                                    ? chat['participants'][1]['avatar']['url']
                                    : chat['participants'][0]['avatar']['url'],
                                'createdAt': chat['createdAt'],
                                'isGroupChat': false,
                              },
                            );
                          },
                        );
                },
              ),
            ),
            Obx(
              () => ListView.builder(
                itemCount: homeController.chatList.length,
                itemBuilder: (context, index) {
                  final chat = homeController.chatList[index];
                  // final name = chat['participants'][1]['username'];
                  final name = chat['name'];
                  final lastMessage = chat['lastMessage']?['content'] != null
                      ? chat['lastMessage']!['content']
                      : chat['lastMessage'] != null
                          ? "${chat['lastMessage']!['attachments'].length} attachment${chat['lastMessage']!['attachments'].length > 1 ? "s" : ""}"
                          : "No messages yet"; // Placeholder text if there are no messages.
                  final lastMessageTime = chat['lastMessage'] != null
                      ? chat['lastMessage']['createdAt']
                      : '';
                  final unreadMessages = chat['lastMessage'] != null
                      ? chat['lastMessage']['attachments'].length
                      : 0;
                  // final unreadMessages = 2;

                  // Assuming apiLastMessageTime is the timestamp from the API
                  String timeAgo = '';
                  if (lastMessageTime != '') {
                    DateTime lastMsgTime = DateTime.parse(lastMessageTime);

                    // Calculate the time difference
                    Duration difference =
                        DateTime.now().difference(lastMsgTime);

                    timeago.setLocaleMessages('en', MyCustomTime());

                    // Convert the time difference to a human-readable format
                    timeAgo = timeago.format(
                      DateTime.now().subtract(difference),
                    );
                  }

                  // print('Attachments: $unreadMessages, ${chat['lastMessage']['attachments'].length}');
                  print('isGroupChat ${chat['isGroupChat']}');
                  return chat['isGroupChat']
                      ? ChatTile(
                          name: name,
                          lastMessage: lastMessage,
                          lastMessageTime: timeAgo,
                          unreadMessages: unreadMessages,
                          onTap: () {
                            print('Group Chat Pressed');
                            Get.toNamed(
                              RouteName.chatScreen,
                              arguments: {
                                'chatId': chat['_id'],
                                'name': name,
                                'avatar':
                                    "https://via.placeholder.com/200x200.png",
                                'createdAt': chat['createdAt'],
                                'participants': chat['participants'],
                                'adminId': chat['admin'],
                                'isGroupChat': true,
                              },
                            );
                          },
                        )
                      : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
