import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_signup_screen.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/widgets/ChatTile.dart';
// import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screen_id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isChatTab = true;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    ); // error of passing 'this' is resolved by adding "SingleTickerProviderStateMixin" on _HomeScreenState class
    // _tabController.addListener(_handleTabChange);
    // print('debug : from init.......');
  }

  void toggleFloatingButton() {
    setState(() {
      isChatTab = !isChatTab;
    });
  }
  // _handleTabChange(){
  //   if(_tabController.indexIsChanging){
  //     int a = _tabController.index;
  //     print('debug : Index is : $a');
  //     toggleFloatingButton();
  //   }
  // }

  @override
  void dispose() {
    _tabController.dispose(); // Don't forget to dispose the controller.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.appbarColor,
          child: isChatTab
              ? Icon(
                  Icons.chat_rounded,
                  color: AppColor.secondaryColor,
                  size: 40,
                )
              : Icon(
                  Icons.groups,
                  color: AppColor.secondaryColor,
                  size: 40,
                ),
          onPressed: () {
            if (isChatTab) {
              Fluttertoast.showToast(msg: 'New Chat Pressed');
            } else {
              Fluttertoast.showToast(msg: 'New Group Pressed');
            }
          },
        ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(
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
            Icon(
              Icons.search,
              color: AppColor.secondaryColor,
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: AppColor.secondaryColor,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: '1',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginSignupScreen.screen_id);
                    },
                    child: Text('Logout'),
                  ),
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

          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.secondaryColor,
            labelColor: AppColor.secondaryColor,
            // isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Itim',
              fontWeight: FontWeight.w400,
            ),
            onTap: (index) {
              if ((index == 0 && !isChatTab) || (index == 1 && isChatTab)) {
                toggleFloatingButton();
              } else if (index == 0 && isChatTab) {
                Fluttertoast.showToast(
                    msg: 'Already on Chat Screen $isChatTab');
              } else if (index == 1 && !isChatTab) {
                Fluttertoast.showToast(msg: 'Already on Peer Groups Screen');
              }
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
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return ChatTile();
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return ChatTile();
              },
            ),
          ],
        ),
      ),
    );
  }
}
