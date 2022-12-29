class PalyerModel {
  PalyerModel({
    this.data,});

  PalyerModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
    this.id,
    this.firstNameLastName,
    this.nationalCode,
    this.gender,
    this.education,
    this.address,
    this.workExperience,
    this.phoneNumber,
    this.statusHealth,
    this.statusBody,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstNameLastName = json['firstName_LastName'];
    nationalCode = json['nationalCode'];
    gender = json['gender'];
    education = json['education'];
    address = json['address'];
    workExperience = json['workExperience'];
    phoneNumber = json['phoneNumber'];
    statusHealth = json['statusHealth'];
    statusBody = json['statusBody'];
  }
  int? id;
  String? firstNameLastName;
  String? nationalCode;
  String? gender;
  String? education;
  String? address;
  String? workExperience;
  String? phoneNumber;
  String? statusHealth;
  String? statusBody;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName_LastName'] = firstNameLastName;
    map['nationalCode'] = nationalCode;
    map['gender'] = gender;
    map['education'] = education;
    map['address'] = address;
    map['workExperience'] = workExperience;
    map['phoneNumber'] = phoneNumber;
    map['statusHealth'] = statusHealth;
    map['statusBody'] = statusBody;
    return map;
  }
}
