import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPlayerWidget extends StatefulWidget {
  AddPlayerWidget({Key? key}) : super(key: key);

  @override
  State<AddPlayerWidget> createState() => _AddPlayerWidgetState();
}

class _AddPlayerWidgetState extends State<AddPlayerWidget> {
  List<DropdownMenuItem<String>> listDrap = [];

  void securityQuestion() {
    listDrap = [];
    listDrap.add(new DropdownMenuItem(child: Text("مرد"), value: "0"));
    listDrap.add(new DropdownMenuItem(
        child: Text(
          "زن",
        ),
        value: "1"));
  }

  final TextEditingController FirstName_LastNameController =
      TextEditingController();
  final TextEditingController NationalCodeController = TextEditingController();
  final TextEditingController EducationController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController PhoneNumberController = TextEditingController();
  final TextEditingController WorkExperienceController =
      TextEditingController();
  final TextEditingController StatusHealthController = TextEditingController();
  final TextEditingController StatusBodyController = TextEditingController();
  String? securityQuestionselected = null;
  int? Gender;
  static addplayer(
      String? FirstName_LastName,
      String? NationalCode,
      int? Gender,
      String? Education,
      String? Address,
      String? PhoneNumber,
      String? WorkExperience,
      String? StatusHealth,
      String? StatusBody) async {
    final response = await http.post(Uri.parse(
        "https://localhost:7272/api/Fifa/AddPlayer?FirstName_LastName=$FirstName_LastName&NationalCode=$NationalCode&Gender=$Gender&Education=$Education&Address=$Address&PhoneNumber=$PhoneNumber&WorkExperience=$WorkExperience&StatusHealth=$StatusHealth&StatusBody=$StatusBody"));
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    securityQuestion();
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
                      const InputDecoration(hintText: "نام ونام خانوادگی"),
                  controller: FirstName_LastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "کدملی"),
                  controller: NationalCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),

                /// از [SizedBox] برای کم و بیشتر کردن سایز یک ویجت استفاده میشود

                SizedBox(
                  width: width,
                  child: DropdownButton(
                      hint: Text(
                        "جنیست",
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'Vazirmatn_Medium'),
                      ),
                      value: securityQuestionselected,
                      items: listDrap,
                      onChanged: (value) {
                        setState(() {
                          securityQuestionselected = value as String;
                          print(securityQuestionselected);
                        });
                      }),
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
                  decoration: const InputDecoration(hintText: "شماره موبایل"),
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
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "وضیعت سلامت"),
                  controller: StatusHealthController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "وضعیت بدن"),
                  controller: StatusBodyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'مقدار نباید خالی باشد';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text("افزودن")]),
                  onPressed: () {
                    Gender = int.tryParse(securityQuestionselected.toString());
                    bool? isValidated = formKey.currentState?.validate();
                    if (isValidated == true) {
                      addplayer(
                          FirstName_LastNameController.text,
                          NationalCodeController.text,
                          Gender,
                          EducationController.text,
                          AddressController.text,
                          PhoneNumberController.text,
                          WorkExperienceController.text,
                          StatusHealthController.text,
                          StatusBodyController.text);
                      final snackBar = SnackBar(
                        content: const Text("بازیکن با موفقیت ثبت شد"),
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
