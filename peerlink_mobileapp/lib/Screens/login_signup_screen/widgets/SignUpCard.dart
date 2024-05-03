
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_controller.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_signup_screen.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/components/round_button.dart';

class SignUpCard extends StatefulWidget {
  // const SignUpCard({super.key});
  // Function toggleCard;
  LoginSignupScreenState loginSignupScreenInstance;

  // loginSignupScreen loginSignupScreenInstance;
  SignUpCard({
    Key? key,
    required this.loginSignupScreenInstance,
  }) : super(key: key);

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  // late final Function toggleCard = widget.toggleCard;
  // loginSignupScreenState loginSignupScreenInstance = widget.loginSignupScreenInstance;
  final _signUpFormKey = GlobalKey<FormState>();

  final loginController = Get.put(LoginController());

  // String id = '';
  // String password = '';
  // String confirmPassword = '';

  late LoginSignupScreenState loginSignupScreenStateInstance;

  // void getIdValueFromTextField(String id) {
  //   this.id = id;
  // }

  // void getPasswordValueFromTextField(String password) {
  //   this.password = password;
  // }

  // void getConfirmPasswordValueFromTextField(String confirmPassword) {
  //   this.confirmPassword = confirmPassword;
  // }

  validatePassAndConfirmPass() {
    if (loginController.passwordController.value.text ==
        loginController.confirmPasswordController.value.text) {
      return true;
    } else {
      Fluttertoast.showToast(msg: "Password and Confirm Password not matched");
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    loginSignupScreenStateInstance = widget.loginSignupScreenInstance;
  }

  @override
  Widget build(BuildContext context) {
    // return
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: 20,
      ),
      height: 520,
      width: MediaQuery.of(context).size.width * 0.82,
      // width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _signUpFormKey,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: double.infinity,
              // color: Colors.pink.shade100,
              width: double.infinity,
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          // toggleBetweenSignInAndSignUp();
                          // toggleCard();
                          loginController.toggleLoginSignup();
                        },
                        child: Container(
                          // height: 30,
                          // width: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "Already on SignUp");
                        },
                        child: Container(
                          // height: 30,
                          // width: 110,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // -------------------------------------------------------
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller: loginController.emailController.value,
                        focusNode: loginController.emailFocusNode.value,
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   Utils.snakBar('Username', 'Enter Username');
                          // }
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        // onFieldSubmitted: (value) => {
                        //   Utils.fieldFocusChange(
                        //       context,
                        //       loginController.emailFocusNode.value,
                        //       loginController.passwordFocusNode.value)
                        // },
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: AppColor.primaryColor,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller: loginController.usernameController.value,
                        focusNode: loginController.usernameFocusNode.value,
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   Utils.snakBar('Username', 'Enter Username');
                          // }
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        // onFieldSubmitted: (value) => {
                        //   Utils.fieldFocusChange(
                        //       context,
                        //       loginController.emailFocusNode.value,
                        //       loginController.passwordFocusNode.value)
                        // },
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: AppColor.primaryColor,
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF0F0F0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: DropdownButtonFormField<String>(
                          value: loginController.roleController.value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.school,
                                color: AppColor.primaryColor),
                            hintText: 'Select Role',
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          onChanged: (String? newValue) {
                            loginController.roleController.value = newValue!;
                            loginController.roleController.refresh();
                          },
                          items: <String>['STUDENT', 'TEACHER']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller: loginController.passwordController.value,
                        focusNode: loginController.passwordFocusNode.value,
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   Utils.snakBar('Password', 'Enter Password');
                          // }
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        obscuringCharacter: '●',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.primaryColor,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller:
                            loginController.confirmPasswordController.value,
                        focusNode:
                            loginController.confirmPasswordFocusNode.value,
                        validator: (value) {
                          // if (value!.isEmpty) {
                          //   Utils.snakBar('Password', 'Enter Password');
                          // }
                          if (value!.isEmpty) {
                            return 'Please enter confirm password';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        obscuringCharacter: '●',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.primaryColor,
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // TextFormFieldPassword(
                  //   hinttext: "Confirm your password",
                  //   sendTextFieldValue: getConfirmPasswordValueFromTextField,
                  // ),
                ],
              ),
            ),

            Positioned(
              top: 415,
              left: 0,
              right: 0,

              child: Obx(
                () => RoundButton(
                  title: "Sign Up",
                  buttonColor: AppColor.primaryColor,
                  textColor: Colors.white,
                  fontSize: 17,
                  height: 35,
                  buttonRadius: 25,
                  loading: loginController.loading.value,
                  onPress: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      _signUpFormKey.currentState!.save();
                      // Fluttertoast.showToast(
                      //     msg:
                      //         "Id : $id -- pass: $password -- conf Pass : $confirmPassword");
                      validatePassAndConfirmPass()
                          ? {
                              loginController.signupApi(),
                              // !loginController.loading.value
                              //     ? loginController.toggleLoginSignup()
                              //     : null,
                            }
                          : null;
                    }
                  },
                ),
              ),
              // ),
            ),

            Positioned(
              top: 460,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      // toggleCard();
                      loginController.toggleLoginSignup();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
