class PersonnelModel {
  PersonnelModel({
    this.data,});

  PersonnelModel.fromJson(dynamic json) {
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
    this.education,
    this.address,
    this.workExperience,
    this.phoneNumber,
  });

  Data.fromJson(dynamic json) {
    id = json['id'] as int;
    firstNameLastName = json['firstName_LastName'];
    nationalCode = json['nationalCode'];
    education = json['education'];
    address = json['address'];
    workExperience = json['workExperience'];
    phoneNumber = json['phoneNumber'];
  }
  int? id;
  String? firstNameLastName;
  String? nationalCode;
  String? education;
  String? address;
  String? workExperience;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName_LastName'] = firstNameLastName;
    map['nationalCode'] = nationalCode;
    map['education'] = education;
    map['address'] = address;
    map['workExperience'] = workExperience;
    map['phoneNumber'] = phoneNumber;
    return map;
  }
}
