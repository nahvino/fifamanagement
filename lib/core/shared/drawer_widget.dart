import 'package:fifamanagement/config/strings.dart';
import 'package:fifamanagement/core/shared/button_drawer.dart';
import 'package:fifamanagement/features/personnel_registration_features/personnel_screen.dart';
import 'package:fifamanagement/features/player_registration_features/player_screen.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/bime_screen.dart';
import 'package:flutter/material.dart';
// محتوایات داور ویجت
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
        ));
  }
}
