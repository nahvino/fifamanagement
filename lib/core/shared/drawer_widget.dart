import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        elevation: 0,
        child: ListView(
          children: [
            const DrawerHeader(
              child:  Text('Drawer Header'),
            ),
            ElevatedButton(onPressed: ()=>"", child: const Icon(Icons.ac_unit_outlined))
          ],
        )
    );
  }
}
