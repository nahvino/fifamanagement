import 'dart:convert';

import 'package:fifamanagement/features/regi_of_play_ins_features/BimeModel.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/bime_widget.dart';
import 'package:fifamanagement/features/regi_of_play_ins_features/edit_bime_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegoplayScreen extends StatefulWidget {
  const RegoplayScreen({Key? key}) : super(key: key);

  @override
  State<RegoplayScreen> createState() => _RegoplayScreenState();
}

class _RegoplayScreenState extends State<RegoplayScreen> {
  //مدل ساخته شده
  BimeModel? bimeModel;

  //متغییر کلاس دیتا از نوع لیست ویو
  List<Data>? bimeData;

  static join_service() async {
    //با متدد get در خواست را به سمت سرور ارسال می کنیم
    final response = await http
        .get(Uri.parse("http://185.8.175.198:2010/api/Fifa/ListBime"));
    //print(json.decode(response.body));
    //اگر در خواست ما با وضعیت 200 برگشت به معنی این است در خواست ما با مموفقیت انجام شده
    if (response.statusCode == 200) {
      print("my response: " + response.body);
      //رمز گشایی جیسون و ارسال ان به مدل
      BimeModel model = BimeModel.fromJson(json.decode(response.body));
      return model;
    }
  }

  static delete_service(int id) async {
    //با متدد delete در خواست را به سمت سرور ارسال می کنیم
    final response = await http.delete(
        Uri.parse("https://localhost:7272/api/Fifa/DeleteBime?Id=$id"));
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
    bimeModel = await join_service();
    //ریختن دیتا ها توی متغییر لیست
    bimeData = bimeModel?.data;
    print(bimeData?.map((e) => e.dateStart));
  }

  @override
  Widget build(BuildContext context) {
    //چپ چین و راست چین کردن صفحه
    return Directionality(
      //به صورت راست به چت باشد
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //تکس باکس اپ بار صفحه
        appBar: AppBar(title: const Text("لیست بیمه")),
        // رنگ اپ بار صفحه
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: ListView.builder(
            itemCount: bimeData!.length,
            shrinkWrap: true,
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
                  Text("نام بیمه شونده : "),
                  Text(bimeData![index].insurerName!),
                ],
              ),
              Row(
                children: [
                  Text("تاریخ آغاز : "),
                  Text(bimeData![index].dateStart!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("تاریخ پایان : "),
                      Text(bimeData![index].dateEnd!),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            //حذف کردن آیتم از دیتابیس
                            delete_service(bimeData![index].id!);
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
                                //برگه بیمه
                                builder: (context) => EditBeimeWidget(
                                      id: bimeData![index].id,
                                      FirstName_LastName:
                                          bimeData![index].insurerName,
                                      DateEnd: bimeData![index].dateEnd,
                                      DateStart: bimeData![index].dateStart,
                                      PalyerId: bimeData![index].palyerId,
                                      PersonelId: bimeData![index].personelId,
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
