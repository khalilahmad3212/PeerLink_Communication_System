import 'dart:async';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then(
      (value) {
        print(value.accessToken);
        print(value.isLogin);
        if (value.isLogin == false || value.isLogin.toString() == 'null') {
          Timer(
            const Duration(seconds: 3),
            () {
              Get.toNamed(RouteName.loginSignupScreen);
            },
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () {
              Get.toNamed(RouteName.homeScreen);
            },
          );
        }
        // Timer(
        //   const Duration(seconds: 3),
        //   () {
        //     // Get.toNamed(RouteName.dashboardScreen);
        //   },
        // );
      },
    );
  }
}
