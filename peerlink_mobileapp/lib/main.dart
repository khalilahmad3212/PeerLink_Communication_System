import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/res/getx_localization/languages.dart';
import 'package:peerlink_mobileapp/res/navigators/routes.dart';
import 'package:peerlink_mobileapp/utils/responsive_size_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveSizeUtil.init(context);

    return GetMaterialApp(
      title: 'PeerLink',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // initialRoute: LoginSignupScreen.screen_id,
      getPages: AppRoutes.appRoutes(),
    );

    // return MaterialApp(

    //   initialRoute: LoginSignupScreen.screen_id,
    //   routes: {
    //     // SplashScreen.screen_id: (context) => SplashScreen(),
    //     LoginSignupScreen.screen_id: (context) => LoginSignupScreen(),
    //     HomeScreen.screen_id: (context) => HomeScreen(),
    //     ChatScreen.screen_id: (context) => ChatScreen(),
    //     InstructorInfoScreen.screen_id: (context) => InstructorInfoScreen(),
    //   },
    // );
  }
}
