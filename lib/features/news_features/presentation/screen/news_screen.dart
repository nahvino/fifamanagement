import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {  },),
      appBar: AppBar(title: const Text("ثبت اخبار")),
      backgroundColor: Colors.grey.shade200,
      body: newsItem(),
    );
  }

  newsItem() {
    return SingleChildScrollView(
      child: ListView(itemExtent: 10, children: [Text("data")]),
    );
  }
}
