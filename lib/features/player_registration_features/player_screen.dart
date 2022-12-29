import 'package:fifamanagement/features/player_registration_features/PalyerModel.dart';
import 'package:fifamanagement/features/player_registration_features/edit_player_widget.dart';
import 'package:fifamanagement/features/player_registration_features/player_widget.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/bime_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  PalyerModel? model;
  List<Data>? list;

  //دریافت لیست بازی کن ها
  static join_service() async {
    final response = await http
        .get(Uri.parse("https://localhost:7272/api/Fifa/ListPlayer"));
    print(json.decode(response.body));
    //
    if (response.statusCode == 200) {
      PalyerModel model = PalyerModel.fromJson(json.decode(response.body));

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
    list = model?.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
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
                builder: (context) => AddPlayerWidget());
          },
        ),
        appBar: AppBar(title: const Text("ثبت بازیکن")),
        backgroundColor: Colors.grey.shade200,
        body: // لیست ویو
            //برای اسکرول خوردن لیست
            SingleChildScrollView(
          child:
              //بیلد کردن لیست ویو
              ListView.builder(
            //آیتم هایی که از مدل دریافت می کند
            itemCount: list!.length,
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
                  Text(list![index].firstNameLastName!),
                ],
              ),
              Row(
                children: [
                  Text("کد ملی : "),
                  Text(list![index].nationalCode!),
                ],
              ),
              if (list![index].gender! == "1")
                Row(
                  children: [
                    Text("جنسیت : "),
                    Text("زن"),
                  ],
                ),
              if (list![index].gender! == "0")
                Row(
                  children: [
                    Text("جنسیت : "),
                    Text("مرد"),
                  ],
                ),
              Row(
                children: [
                  Text("تحصیلات : "),
                  Text(list![index].education!),
                ],
              ),
              Row(
                children: [
                  Text("آدرس : "),
                  Text(list![index].address!),
                ],
              ),
              Row(
                children: [
                  Text("شماره تلفن : "),
                  Text(list![index].phoneNumber!),
                ],
              ),
              Row(
                children: [
                  Text("وضعیت سلامت : "),
                  Text(list![index].statusHealth!),
                ],
              ),
              Row(
                children: [
                  Text("وضیعت بدن : "),
                  Text(list![index].statusBody!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("سابقه : "),
                      Text(list![index].workExperience!),
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
                                      PersonelId: 0,
                                      FirstName_LastName:
                                          list![index].firstNameLastName!,
                                      PalyerId: list![index].id!,
                                    ));
                          },
                          icon: Icon(Icons.accessibility_new)),
                      IconButton(
                          onPressed: () {
                            //حذف کردن آیتم از دیتابیس
                            delete_service(list![index].id!);
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
                                builder: (context) => EditPlayerWidget(
                                      id: list![index].id!,
                                      FirstName_LastName:
                                          list![index].firstNameLastName!,
                                      NationalCode: list![index].nationalCode!,
                                      Gender: list![index].gender!,
                                      Education: list![index].education!,
                                      Address: list![index].address!,
                                      PhoneNumber: list![index].phoneNumber!,
                                      WorkExperience:
                                          list![index].workExperience!,
                                      StatusHealth: list![index].statusHealth!,
                                      StatusBody: list![index].statusBody!,
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
