import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBeimeWidget extends StatefulWidget {
  AddBeimeWidget(
      {Key? key, this.PalyerId, this.PersonelId, this.FirstName_LastName})
      : super(key: key);

  final String? FirstName_LastName;
  final int? PalyerId;

  final int? PersonelId;

  static addplayer(String? FirstName_LastName, String? DateStart,
      String? DateEnd, int? PalyerId, int? PersonelId) async {
    final response = await http.post(Uri.parse(
        "http://185.8.175.198:2010/api/Fifa/AddBime?InsurerName=$FirstName_LastName&DateStart=$DateStart&DateEnd=$DateEnd&PalyerId=$PalyerId&PersonelId=$PersonelId"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return response.body;
    }
    // else {
    //   throw Exception('Failed to load album');
    // }
  }

  @override
  State<AddBeimeWidget> createState() => _AddBeimeWidgetState();
}

class _AddBeimeWidgetState extends State<AddBeimeWidget> {
  final TextEditingController FirstName_LastNameController =
      TextEditingController();

  final TextEditingController DateStartController = TextEditingController();

  final TextEditingController DateEndController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  static AddBime(String? InsurerName, String? DateStart,
      String? DateEnd, int? PalyerId, int? PersonelId) async {
    final response = await http.post(Uri.parse(
        "https://localhost:7272/api/Fifa/AddBime?InsurerName=$InsurerName&DateStart=$DateStart&DateEnd=$DateEnd&PalyerId=$PalyerId&PersonelId=$PersonelId"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return response.body;
    }
    // else {
    //   throw Exception('Failed to load album');
    // }
  }

  @override
  void initState() {
    super.initState();

    FirstName_LastNameController.text = widget.FirstName_LastName!;
    print(widget.PalyerId);
    print(widget.PersonelId);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 540,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "نام و نام خانوادگی"),
                  controller: FirstName_LastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "تاریخ آغاز 1401/10/10"),
                  controller: DateStartController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "تاریخ پایان 1400/10/10"),
                  controller: DateEndController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text("افزودن")]),
                  onPressed: () {
                    bool? isValidated = formKey.currentState?.validate();
                    if (isValidated == true) {
                      AddBime(FirstName_LastNameController.text,DateStartController.text,DateEndController.text,widget.PalyerId,widget.PersonelId);
                      final snackBar = SnackBar(
                        content: const Text("بیمه با موفقیت ثبت شد"),
                        backgroundColor: (Colors.black12),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    } else {
                      //Navigator.pop(context);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text("Enter valid values")));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
