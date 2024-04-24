import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/models/user_model.dart';
import 'package:peerlink_mobileapp/repository/login_repository/login_repository.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;

  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final usernameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    loading.value = true;
    print('inside loginApi');
    Map data = {
      'username': usernameController.value.text,
      'password': passwordController.value.text,
    };
    print(data);
    _api.loginApi(data).then(
      (value) {
        loading.value = false;
        UserModel userModel = UserModel(
          token: value['data']['accessToken'],
          isLogin: true,
        );
        print("UserModel =======> ${userModel.token}, ${userModel.isLogin}");
        userPreference.saveUser(userModel).then(
          (value) {
            // Get.toNamed(RouteName.dashboardScreen);
          },
        ).onError((error, stackTrace) {});
        Utils.snakBar('Login', 'Login Successfully');
        Utils.toastMessage('Login Successfully');
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage('');
      },
    );
  }
}
