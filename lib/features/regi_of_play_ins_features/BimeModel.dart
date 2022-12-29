class BimeModel {
  BimeModel({
    this.data,});

  BimeModel.fromJson(dynamic json) {
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
    this.insurerName,
    this.dateStart,
    this.dateEnd,
    this.palyerId,
    this.personelId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    insurerName = json['insurerName'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    palyerId = json['palyerId'];
    personelId = json['personelId'];
  }
  int? id;
  String? insurerName;
  String? dateStart;
  String? dateEnd;
  int? palyerId;
  int? personelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['insurerName'] = insurerName;
    map['dateStart'] = dateStart;
    map['dateEnd'] = dateEnd;
    map['palyerId'] = palyerId;
    map['personelId'] = personelId;
    return map;
  }

}