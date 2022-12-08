import 'package:flutter/material.dart';

class PersonnelScreen extends StatelessWidget {
  const PersonnelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {  },),
      appBar: AppBar(title: const Text("ثبت پرسنل")),
      backgroundColor: Colors.grey.shade200,
      body: personnelItem(),
    );
  }

  personnelItem() {
    return ListView.builder( itemBuilder: (context, index) {
      return
        Card(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete),),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit),)
                  ],),
                  Row(children: [
                    Text("as")
                  ],)
                ],),

            ],)
        );

    },  itemCount: 10,);
  }
}
