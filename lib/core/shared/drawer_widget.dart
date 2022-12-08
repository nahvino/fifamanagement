import 'package:fifamanagement/config/strings.dart';
import 'package:fifamanagement/core/shared/button_drawer.dart';
import 'package:fifamanagement/features/news_features/presentation/screen/news_screen.dart';
import 'package:fifamanagement/features/personnel%D9%80registration_features/presentation/screen/personnel_screen.dart';
import 'package:fifamanagement/features/player%D9%80registration_features/presentation/screen/player_screen.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/presentation/screen/regofplay_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(children: [
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text(Strings.version)],
                )
              ]),
            ),
           ButtonDrawer(
                icon: Icons.add,
                text: "ثبت پرسنل", btn: () {  Get.to(const PersonnelScreen()); },
              ),

            const SizedBox(
              height: 8,
            ),

              ButtonDrawer(
                icon: Icons.add,
                text: "ثبت بازیکن",
               btn:() {
               Get.to(const PlayerScreen());
             },
              ),

            const SizedBox(
              height: 8,
            ),
            ButtonDrawer(
                icon: Icons.add,
                text: "ثبت بیمه بازیکن ", btn: () {  Get.to(const RegoplayScreen());},
              ), const SizedBox(
              height: 8,
            ),
            ButtonDrawer(
                icon: Icons.add,
                text: "ثبت اخبار ", btn: () {  Get.to(const NewsScreen());},
              ),

          ],
        ));
  }
}
