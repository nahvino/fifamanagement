import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {  },),
      appBar: AppBar(title: const Text("ثبت بازیکن")),
      backgroundColor: Colors.grey.shade200,
      body: playerItem(),
    );
  }

  playerItem() {
    return ListView(itemExtent: 10, children: [Text("data")]);
  }
}