import 'package:fifamanagement/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
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
    return const MaterialApp(
      //بستن بنر دیباگ
      debugShowCheckedModeBanner: false,
      //صفحه ی اصلی
      home: Directionality(
          textDirection: TextDirection.rtl, child: SplashScreen()),
    );
  }
}
