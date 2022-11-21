import 'package:flutter/material.dart';

void main() {
  //شروع نرم افزار
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //بستن بنر دیباگ
      debugShowCheckedModeBanner: false,
      //صفحه ی اصلی
     // home: ,

    );
  }
}
