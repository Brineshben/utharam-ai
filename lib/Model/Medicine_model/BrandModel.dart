class BrandModel {
  String? status;
  String? message;
  int? count;
  List<Data>? data;

  BrandModel({this.status, this.message, this.count, this.data});

  BrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? brand;
  String? brandName;
  int? medicine;
  String? medicineName;
  bool? status;
  String? assignedAt;

  Data(
      {this.id,
        this.brand,
        this.brandName,
        this.medicine,
        this.medicineName,
        this.status,
        this.assignedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    brandName = json['brand_name'];
    medicine = json['medicine'];
    medicineName = json['medicine_name'];
    status = json['status'];
    assignedAt = json['assigned_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['brand_name'] = this.brandName;
    data['medicine'] = this.medicine;
    data['medicine_name'] = this.medicineName;
    data['status'] = this.status;
    data['assigned_at'] = this.assignedAt;
    return data;
  }
}