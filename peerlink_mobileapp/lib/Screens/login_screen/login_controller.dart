import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/models/login/user_model.dart';
import 'package:peerlink_mobileapp/repository/login_repository/login_repository.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': emailController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true,
      );
      userPreference.saveUser(userModel).then((value) {
        Get.toNamed(RouteName.dashboardScreen);
      }).onError((error, stackTrace) {});
      Utils.snakBar('Login', 'Login Successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snakBar('Error', error.toString());
    });
  }
}
