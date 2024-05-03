import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/models/user_model.dart';
import 'package:peerlink_mobileapp/repository/login_repository.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;
  RxBool isLogIn = true.obs;

  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  RxString roleController = 'STUDENT'.obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final usernameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final roleFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  void toggleLoginSignup() {
    isLogIn.value = !isLogIn.value;
    emailController.value.clear();
    usernameController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
  }

  // void loginApi() {
  //   loading.value = true;
  //   print('inside loginApi');
  //   Map data = {
  //     'username': usernameController.value.text,
  //     'password': passwordController.value.text,
  //   };
  //   print(data);
  //   _api.loginApi(data).then(
  //     (value) {
  //       loading.value = false;
  //       UserModel userModel = UserModel(
  //         token: value['data']['accessToken'],
  //         isLogin: true,
  //       );
  //       print("UserModel =======> ${userModel.token}, ${userModel.isLogin}");
  //       userPreference.saveUser(userModel).then(
  //         (value) {
  //           Get.toNamed(RouteName.homeScreen);
  //         },
  //       ).onError((error, stackTrace) {});
  //       String errorMessage = value['message'] ?? 'Unknown error occurred';
  //       Utils.snakBar('Login', errorMessage);
  //       Utils.toastMessage(errorMessage);
  //       Get.toNamed(RouteName.homeScreen);
  //     },
  //   ).onError(
  //     (error, stackTrace) {
  //       loading.value = false;
  //       Utils.snakBar('Error', 'Happy Birthday');
  //       Utils.toastMessage(error.toString());
  //     },
  //   );
  // }
  void loginApi() {
    loading.value = true;
    print('inside loginApi');
    Map<String, String> data = {
      'username': usernameController.value.text,
      'password': passwordController.value.text,
    };
    print(data);
    _api.loginApi(data).then(
      (value) {
        loading.value = false;
        if (value['success'] == true) {
          UserModel userModel = UserModel(
            user: User.fromJson(value['data']['user']),
            accessToken: value['data']['accessToken'],
            refreshToken: value['data']['refreshToken'],
            isLogin: true,
          );
          print("UserModel =======> ${userModel.toJson()}");
          userPreference.saveUser(userModel).then(
            (value) {
              Get.toNamed(RouteName.homeScreen);
            },
          ).onError((error, stackTrace) {});
          Utils.snakBar('Login', 'Login Successfully');
          Utils.toastMessage('Login Successfully');
          Get.toNamed(RouteName.homeScreen);
        } else {
          String errorMessage = value['message'] ?? 'Unknown error occurred';
          Utils.snakBar('Error', errorMessage);
          Utils.toastMessage(errorMessage);
        }
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }

  void signupApi() {
    loading.value = true;
    print(roleController.value);
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'role': roleController.value,
      'username': usernameController.value.text,
    };
    _api.signupApi(data).then(
      (value) {
        loading.value = false;
        // Handle signup success, if needed
        Utils.snakBar('Signup', 'Signup Successful');
        // Utils.toastMessage('Signup Successful');
        toggleLoginSignup();
        // Navigate to another screen after successful signup
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        toggleLoginSignup();
        // Handle signup error
        // Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }
}
