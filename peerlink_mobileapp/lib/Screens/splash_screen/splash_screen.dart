import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peerlink_mobileapp/Screens/splash_screen/splash_services.dart';
import 'package:peerlink_mobileapp/res/assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  static const String screen_id = 'WelcomeScreen';
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        ImageAssets.peerlinkLogo,
        width: 200,
        height: 200,
      ),
      // child: Image.asset(
      //   ImageAssets.partyMapLogo,
      //   width: 250,
      // ),
    );
  }
}
