import 'package:flutter/material.dart';

class RegoplayScreen extends StatelessWidget {
  const RegoplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {  },),
      appBar: AppBar(title: const Text("ثبت بیمه بازیکن")),
      backgroundColor: Colors.grey.shade200,
      body: regoplayItem(),
    );
  }

  regoplayItem() {
    return ListView(itemExtent: 10, children: const [Text("data")]);
  }
}
