import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:fifamanagement/features/main_features/main_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //کتاب خانه اسپلش برای ورودی اپ
    return  EasySplashScreen(
      logo:  Image.asset(
          "assets/images/logo.png"),
      logoWidth: 150,
      backgroundColor: Colors.blueAccent,
      showLoader: true,
      loaderColor: Colors.white,
      loadingText: const Text("لطفا کمی صبر کنید ...",style: TextStyle(color: Colors.white)),
      navigator: Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen()),
      durationInSeconds: 5,
    );
  }
}
