class AddtalktohumanModel {
  String? status;
  String? message;
  List<Data>? data;

  AddtalktohumanModel({this.status, this.message, this.data});

  AddtalktohumanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? role;
  String? mobileNumber;
  bool? isCallAvailable;
  List<VoxbayCalls>? voxbayCalls;

  Data(
      {this.id,
        this.name,
        this.email,
        this.role,
        this.mobileNumber,
        this.isCallAvailable,
        this.voxbayCalls});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    mobileNumber = json['mobile_number'];
    isCallAvailable = json['is_call_available'];
    if (json['voxbay_calls'] != null) {
      voxbayCalls = <VoxbayCalls>[];
      json['voxbay_calls'].forEach((v) {
        voxbayCalls!.add(new VoxbayCalls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['mobile_number'] = this.mobileNumber;
    data['is_call_available'] = this.isCallAvailable;
    if (this.voxbayCalls != null) {
      data['voxbay_calls'] = this.voxbayCalls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoxbayCalls {
  String? didNo;
  String? empCode;
  String? extNo;
  String? createdAt;
  bool? isActive;

  VoxbayCalls(
      {this.didNo, this.empCode, this.extNo, this.createdAt, this.isActive});

  VoxbayCalls.fromJson(Map<String, dynamic> json) {
    didNo = json['did_no'];
    empCode = json['emp_code'];
    extNo = json['ext_no'];
    createdAt = json['created_at'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did_no'] = this.didNo;
    data['emp_code'] = this.empCode;
    data['ext_no'] = this.extNo;
    data['created_at'] = this.createdAt;
    data['is_active'] = this.isActive;
    return data;
  }
}