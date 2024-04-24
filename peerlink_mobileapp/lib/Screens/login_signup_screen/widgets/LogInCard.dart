import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/home_screen.dart/HomeScreen.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_controller.dart';
import 'package:peerlink_mobileapp/Screens/login_signup_screen/login_signup_screen.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/components/round_button.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class LogInCard extends StatefulWidget {
  // const SignInCard({super.key});

  LoginSignupScreenState signUpSignInScreenInstance;

  LogInCard({
    Key? key,
    required this.signUpSignInScreenInstance,
  }) : super(key: key);

  @override
  State<LogInCard> createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  late LoginSignupScreenState signUpSignInScreenStateInstance;

  final loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    signUpSignInScreenStateInstance = widget.signUpSignInScreenInstance;
  }

  final _logInFormKey = GlobalKey<FormState>();
  // String id = '';
  // String password = '';

  // void getIdValueFromTextField(String id) {
  //   this.id = id;
  // }

  // void getPasswordValueFromTextField(String password) {
  //   this.password = password;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: 20,
      ),
      height: 450,
      width: MediaQuery.of(context).size.width * 0.82,
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
        key: _logInFormKey,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: double.infinity,
              // color: Colors.pink.shade100,
              width: double.infinity,
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColor.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "Already on LogIn");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
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
                          signUpSignInScreenStateInstance
                              .toggleBetweenSignInAndSignUp();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColor.primaryColor,
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
              top: 90,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // TextFormFieldId(
                  //     hintText: "Enter your Id",
                  //     sendTextFieldValue: getIdValueFromTextField),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller: loginController.usernameController.value,
                        focusNode: loginController.usernameFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snakBar('Username', 'Enter Username');
                          }
                        },
                        // onFieldSubmitted: (value) => {
                        //   Utils.fieldFocusChange(
                        //       context,
                        //       loginController.emailFocusNode.value,
                        //       loginController.passwordFocusNode.value)
                        // },
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: AppColor.primaryColor,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // TextFormFieldPassword(
                  //     hinttext: "Enter your password",
                  //     sendTextFieldValue: getPasswordValueFromTextField),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF0F0F0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: TextFormField(
                        controller: loginController.passwordController.value,
                        focusNode: loginController.passwordFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snakBar('Password', 'Enter Password');
                          }
                        },
                        onFieldSubmitted: (value) {},
                        obscureText: true,
                        obscuringCharacter: '●',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.blackColor,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.primaryColor,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*
                  TextFormField(
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      // prefixIcon: Icon(Icons.person),
                      // prefixIconConstraints: const BoxConstraints(
                      //   // minHeight: 0,
                      //   maxHeight: 8,
                      // ),
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(
                        // bottom: 20,
                        top: 20,
                      ),
                      hintText: 'Enter your Id',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Id';
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Enter your Id')),
                        // );
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _id = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(Icons.password_sharp),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.password_sharp,
                      // ),
                      // prefixIconConstraints: const BoxConstraints(
                      //   // minHeight: 0,
                      //   maxHeight: 8,
                      // ),
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(
                        // bottom: 20,
                        top: 20,
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Enter your Id')),
                        // );
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _id = int.parse(value!);
                    },
                  ),
                  */

                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          signUpSignInScreenStateInstance
                              .forgetPasswordPressed();
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 310,
                left: 0,
                right: 0,
                // child: GestureDetector(
                //   onTap: () {
                //     if (_logInFormKey.currentState!.validate()) {
                //       _logInFormKey.currentState!.save();
                //       // signUpSignInScreenStateInstance.logIn(id, password);
                //       // add 3 secondas delay
                //       loginController.loginApi();
                //       loginController.loading.value
                //           ? Navigator.pushNamed(context, HomeScreen.screen_id)
                //           : "";
                //     }
                //     // btnLogInPressed();
                //   },
                child: RoundButton(
                  title: "Log In",
                  buttonColor: AppColor.primaryColor,
                  textColor: Colors.white,
                  fontSize: 17,
                  height: 35,
                  buttonRadius: 25,
                  loading: loginController.loading.value,
                  onPress: () {
                    if (_logInFormKey.currentState!.validate()) {
                      _logInFormKey.currentState!.save();
                      // signUpSignInScreenStateInstance.logIn(id, password);
                      // add 3 secondas delay
                      loginController.loginApi();
                      loginController.loading.value
                          ? Navigator.pushNamed(context, HomeScreen.screen_id)
                          : "";
                    }
                  },
                )
                // : MyButton(
                //     title: "Log In",
                //     btnColor: AppColor.primaryColor,
                //     onPress: () {},
                //   ),
                // ),
                ),

            Positioned(
              top: 380,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        signUpSignInScreenStateInstance
                            .toggleBetweenSignInAndSignUp();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
