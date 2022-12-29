import 'dart:convert';
import 'package:fifamanagement/features/personnel_registration_features/PersonnelModel.dart';
import 'package:fifamanagement/features/personnel_registration_features/edit_person_widget.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/bime_widget.dart';
import 'package:http/http.dart' as http;
import 'package:fifamanagement/features/personnel_registration_features/add_person-widget.dart';
import 'package:flutter/material.dart';

class PersonnelScreen extends StatefulWidget {
  PersonnelScreen({Key? key}) : super(key: key);

  @override
  State<PersonnelScreen> createState() => _PersonnelScreenState();
}

class _PersonnelScreenState extends State<PersonnelScreen> {
  //مدل ساخته شده
  PersonnelModel? model;

  //متغییر کلاس دیتا از نوع لیست ویو
  List<Data>? datamodel;

  static join_service() async {
    final response = await http
        .get(Uri.parse("https://localhost:7272/api/Fifa/ListPersonel"));
    //print(json.decode(response.body));
    //
    if (response.statusCode == 200) {
      PersonnelModel model =
          PersonnelModel.fromJson(json.decode(response.body));
      return model;
    }
  }

  static delete_service(int id) async {
    //با متدد delete در خواست را به سمت سرور ارسال می کنیم
    final response = await http.delete(
        Uri.parse("https://localhost:7272/api/Fifa/DeletePersonel?Id=$id"));
    //print(json.decode(response.body));
    //اگر در خواست ما با وضعیت 200 برگشت به معنی این است در خواست ما با مموفقیت انجام شده
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  @override
  void initState() {
    super.initState();
    Start();
  }

  // بعد از بالا آمادن برگه در خواست ما به سمت سرور می شود
  Start() async {
    //ریختن داده های توی مدل
    model = await join_service();
    //ریختن دیتا ها توی متغییر لیست
    datamodel = model?.data;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // ثبت پرسنل
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                context: context,
                builder: (context) => AddPersonWidget());
          },
        ),
        // اپ بار بالا
        appBar: AppBar(title: const Text("ثبت پرسنل")),
        backgroundColor: Colors.grey.shade200,
        // لیست ویو
        body:
            //برای اسکرول خوردن لیست
            SingleChildScrollView(
          child:
              //بیلد کردن لیست ویو
              ListView.builder(
            //آیتم هایی که از مدل دریافت می کند
            itemCount: datamodel!.length,
            shrinkWrap: true,
            //آیتم هایی که در ui قرار می گیرید
            itemBuilder: requestList_item,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

  // محتوای لیست ویو
  Widget requestList_item(context, index) {
    return Column(children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: (Column(
            children: [
              Row(
                children: [
                  Text("نام نام خانوادگی : "),
                  Text(datamodel![index].firstNameLastName!),
                ],
              ),
              Row(
                children: [
                  Text("کد ملی : "),
                  Text(datamodel![index].nationalCode!),
                ],
              ),
              Row(
                children: [
                  Text("تحصیلات : "),
                  Text(datamodel![index].education!),
                ],
              ),
              Row(
                children: [
                  Text("آدرس : "),
                  Text(datamodel![index].address!),
                ],
              ),
              Row(
                children: [
                  Text("شماره تلفن : "),
                  Text(datamodel![index].phoneNumber!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("سابقه : "),
                      Text(datamodel![index].workExperience!),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            //ثبت بیمه
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                context: context,
                                //برگه بیمه
                                builder: (context) => AddBeimeWidget(
                                      PersonelId: datamodel![index].id!,
                                      FirstName_LastName:
                                          datamodel![index].firstNameLastName!,
                                      PalyerId: 0,
                                    ));
                          },
                          icon: Icon(Icons.accessibility_new)),
                      IconButton(
                          onPressed: () {
                            //حذف کردن آیتم از دیتابیس
                            delete_service(datamodel![index].id!);
                            datamodel?.remove(datamodel![index].id!);
                            //  datamodel?.removeAt(datamodel![index].id!);
                            final snackBar = SnackBar(
                              content: const Text("بیمه  با حذف  شد"),
                              backgroundColor: (Colors.black12),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                context: context,
                                //برگه ویرایش پرسنل
                                builder: (context) => EditPersonWidget(
                                      id: datamodel![index].id!,
                                      username:
                                          datamodel![index].firstNameLastName!,
                                      NationalCode:
                                          datamodel![index].nationalCode!,
                                      Education: datamodel![index].education!,
                                      Address: datamodel![index].address!,
                                      PhoneNumber:
                                          datamodel![index].phoneNumber!,
                                      WorkExperience:
                                          datamodel![index].workExperience!,
                                    ));
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
      )
    ]);
  }
}
