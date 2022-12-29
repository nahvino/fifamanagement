import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPersonWidget extends StatefulWidget {
  AddPersonWidget({Key? key}) : super(key: key);

  @override
  State<AddPersonWidget> createState() => _AddPersonWidgetState();
}

class _AddPersonWidgetState extends State<AddPersonWidget> {
  //متغییر چک کردن نال بودن تکس فیلد ها
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //کنترل های تکس فیلد ها
  final TextEditingController usernamefamliyController =
      TextEditingController();

  final TextEditingController NationalCodeController = TextEditingController();

  final TextEditingController EducationController = TextEditingController();

  final TextEditingController AddressController = TextEditingController();

  final TextEditingController PhoneNumberController = TextEditingController();

  final TextEditingController WorkExperienceController =
      TextEditingController();

  static addperson(String? username, String? NationalCode, String? Education,
      String? Address, String? PhoneNumber, String? WorkExperience) async {
    final response = await http.post(Uri.parse(
        "https://localhost:7272/api/Fifa/AddPersonel?FirstName_LastName=$username&NationalCode=$NationalCode &Education=$Education &Address=$Address&PhoneNumber=0932654512&WorkExperience=$WorkExperience"));
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 625,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "نام"),
                  controller: usernamefamliyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "کد ملی"),
                  controller: NationalCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(hintText: "تحصیلات"),
                  controller: EducationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "آدرس"),
                  controller: AddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),

              
                TextFormField(
                  decoration: const InputDecoration(hintText: "شماره تلفن"),
                  controller: PhoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "سابقه"),
                  controller: WorkExperienceController,
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
                    bool? isValidated = _formKey.currentState?.validate();
                    if (isValidated == true) {
                      addperson(
                          usernamefamliyController.text,
                          NationalCodeController.text,
                          EducationController.text,
                          AddressController.text,
                          PhoneNumberController.text,
                          WorkExperienceController.text);
                      final snackBar = SnackBar(
                        content: const Text("پرسنل با موفقیت ثبت شد"),
                        backgroundColor: (Colors.black12),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.pop(context);
                    } else {}
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
