import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditPersonWidget extends StatefulWidget {
  EditPersonWidget(
      {Key? key,
      this.id,
      this.username,
      this.NationalCode,
      this.Education,
      this.Address,
      this.PhoneNumber,
      this.WorkExperience})
      : super(key: key);
  final int? id;
  final String? username;
  final String? NationalCode;
  final String? Education;
  final String? Address;
  final String? PhoneNumber;
  final String? WorkExperience;

  @override
  State<EditPersonWidget> createState() => _EditPersonWidgetState();
}

class _EditPersonWidgetState extends State<EditPersonWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernamefamliyController =
      TextEditingController();

  final TextEditingController NationalCodeController = TextEditingController();

  final TextEditingController EducationController = TextEditingController();

  final TextEditingController AddressController = TextEditingController();

  final TextEditingController PhoneNumberController = TextEditingController();

  final TextEditingController WorkExperienceController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  static Eidtperson(
      int? id,
      String? username,
      String? NationalCode,
      String? Education,
      String? Address,
      String? PhoneNumber,
      String? WorkExperience) async {
    final response = await http.put(Uri.parse(
        "https://localhost:7272/api/Fifa/UpdatePersonel?id=$id&FirstName_LastName=$username&NationalCode=$NationalCode &Education=$Education &Address=$Address&PhoneNumber=0932654512&WorkExperience=$WorkExperience"));
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  void initState() {
    super.initState();
    usernamefamliyController.text = widget.username ?? "";
    NationalCodeController.text = widget.NationalCode ?? "";
    EducationController.text = widget.Education ?? "";
    AddressController.text = widget.Address ?? "";
    PhoneNumberController.text = widget.PhoneNumber ?? "";
    WorkExperienceController.text = widget.WorkExperience ?? "";
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
                      Eidtperson(
                          widget.id,
                          usernamefamliyController.text,
                          NationalCodeController.text,
                          EducationController.text,
                          AddressController.text,
                          PhoneNumberController.text,
                          WorkExperienceController.text);
                      final snackBar = SnackBar(
                        content: const Text("پرسنل با موفقیت ویرایش شد"),
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
