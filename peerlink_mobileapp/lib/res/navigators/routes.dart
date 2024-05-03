import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/chat_info_screen/chat_info_screen.dart';
import 'package:peerlink_mobileapp/Screens/chat_screen/ChatScreen.dart';
import 'package:peerlink_mobileapp/Screens/groupchat_info_screen.dart/groupchat_info_screen.dart';
import 'package:peerlink_mobileapp/Screens/home_screen.dart/HomeScreen.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_signup_screen.dart';
import 'package:peerlink_mobileapp/Screens/profile_screen.dart/profile_screen.dart';
import 'package:peerlink_mobileapp/Screens/search_user_screen/create_group_screen.dart';
import 'package:peerlink_mobileapp/Screens/search_user_screen/search_user_screen.dart';
import 'package:peerlink_mobileapp/Screens/splash_screen/splash_screen.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        // GetPage(
        //   name: RouteName.dashboardScreen,
        //   page: () {
        //     Get.put(DashboardController()); // Instantiate DashboardController
        //     return const DashboardScreen();
        //   },
        //   transitionDuration: const Duration(milliseconds: 250),
        //   transition: Transition.noTransition,
        // ),
        GetPage(
          name: RouteName.loginSignupScreen,
          page: () => const LoginSignupScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.profileScreen,
          page: () => const ProfileScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.chatScreen,
          page: () => const ChatScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.searchUserScreen,
          page: () => const SearchUser(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.createGroupChatScreen,
          page: () => const CreateGroupChat(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.chatInfoScreen,
          page: () => const ChatInfoScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RouteName.groupInfoScreen,
          page: () => const GroupInfoScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
      ];
}
