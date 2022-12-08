import 'package:fifamanagement/core/data/app_database.dart';
import 'package:fifamanagement/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  //شروع نرم افزار
  runApp(const MyApp());
}
/*
Directionality(
          textDirection: TextDirection.rtl, child: SplashScreen()),
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      //بستن بنر دیباگ
      debugShowCheckedModeBanner: false,
      //صفحه ی اصلی
      home: Directionality(
          textDirection: TextDirection.rtl, child: SplashScreen()),

    );
  }
}
