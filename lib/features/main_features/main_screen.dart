import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fifamanagement/config/strings.dart';
import 'package:fifamanagement/core/shared/button_drawer.dart';
import 'package:fifamanagement/core/shared/drawer_widget.dart';
import 'package:fifamanagement/features/personnel_registration_features/personnel_screen.dart';
import 'package:fifamanagement/features/player_registration_features/player_screen.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/bime_screen.dart';
import 'package:fifamanagement/generated/assets.dart';
import 'package:flutter/material.dart';
// صفحه اصلی
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  CarouselController buttonCarouselController = CarouselController();
  //لیستی از لینک عکس ها
  final List<String> images = [
    'https://www.elpais.com.co/files/article_main/uploads/2022/09/29/63364b08dc406.jpeg',
    'https://asset.indosport.com/article/image/q/80/239697/logo_fifa-169.jpg?w=750&h=423',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              //تصویر لوگو اپ
              child: Image.asset(
                Assets.logo,
                color: Colors.white,
              ),
            )
          ],
          //متن اپ بار بالا
          title: const Text(Strings.appName,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900))),
      backgroundColor: Colors.grey.shade200,
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          //کتاب خونه اد شده جهت نمایش عکس ها
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                //clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(image: NetworkImage(images[index])),
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            },
          ),
          ButtonDrawer(
            icon: Icons.add,
            text: "ثبت پرسنل",
            btn: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PersonnelScreen()));
            },
          ),

          const SizedBox(
            height: 8,
          ),

          ButtonDrawer(
            icon: Icons.add,
            text: "ثبت بازیکن",
            btn: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PlayerScreen()));
            },
          ),

          const SizedBox(
            height: 8,
          ),
          ButtonDrawer(
            icon: Icons.add,
            text: "ثبت بیمه بازیکن ",
            btn: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  RegoplayScreen()));
            },
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
