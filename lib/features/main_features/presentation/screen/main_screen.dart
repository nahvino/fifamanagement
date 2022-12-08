import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fifamanagement/config/strings.dart';
import 'package:fifamanagement/core/shared/drawer_widget.dart';
import 'package:fifamanagement/features/news_features/presentation/widget/news_widget.dart';
import 'package:fifamanagement/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  CarouselController buttonCarouselController = CarouselController();
  final List<String> images = [
    'https://img.nzz.ch/2022/05/10/37bae579-7e6d-4c1e-ad26-21bbf23567b2.jpeg?width=654&height=367&fit=bounds&quality=75&auto=webp&crop=1920,1079,x0,y0https://img.nzz.ch/2022/05/10/37bae579-7e6d-4c1e-ad26-21bbf23567b2.jpeg?width=654&height=367&fit=bounds&quality=75&auto=webp&crop=1920,1079,x0,y0',
    'https://www.elpais.com.co/files/article_main/uploads/2022/09/29/63364b08dc406.jpeg',
    'https://asset.indosport.com/article/image/q/80/239697/logo_fifa-169.jpg?w=750&h=423',
    'https://assets.architecturaldigest.in/photos/60082342345ead69c9c1aeb6/master/pass/FIFA-2018-World-Cup-Featured-1366x768.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                Assets.logo,
                color: Colors.white,
              ),
            )
          ],
          title: const Text(Strings.appName,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900))),
      backgroundColor: Colors.grey.shade200,
      drawer: const DrawerWidget(),
      body: Column(
        children: [
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
          const NewsWidget()
        ],
      ),
    );
  }
}
