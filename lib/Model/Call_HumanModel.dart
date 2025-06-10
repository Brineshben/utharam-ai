class CallHumanModel {
  String? status;
  String? message;
  List<Data>? data;

  CallHumanModel({this.status, this.message, this.data});

  CallHumanModel.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? email;
  String? mobileNumber;
  String? medicalReport;
  String? medicalReportUrl;
  String? role;
  int? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;
  String? patientId;
  String? verified;
  bool? chatEnabled;
  bool? isCallAvailable;
  VoxbayDetails? voxbayDetails;

  Data(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.mobileNumber,
        this.medicalReport,
        this.medicalReportUrl,
        this.role,
        this.age,
        this.gender,
        this.occupation,
        this.education,
        this.address,
        this.patientId,
        this.verified,
        this.chatEnabled,
        this.isCallAvailable,
        this.voxbayDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    medicalReport = json['medical_report'];
    medicalReportUrl = json['medical_report_url'];
    role = json['role'];
    age = json['age'];
    gender = json['gender'];
    occupation = json['occupation'];
    education = json['education'];
    address = json['address'];
    patientId = json['patient_id'];
    verified = json['verified'];
    chatEnabled = json['chat_enabled'];
    isCallAvailable = json['is_call_available'];
    voxbayDetails = json['voxbay_details'] != null
        ? new VoxbayDetails.fromJson(json['voxbay_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['medical_report'] = this.medicalReport;
    data['medical_report_url'] = this.medicalReportUrl;
    data['role'] = this.role;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['education'] = this.education;
    data['address'] = this.address;
    data['patient_id'] = this.patientId;
    data['verified'] = this.verified;
    data['chat_enabled'] = this.chatEnabled;
    data['is_call_available'] = this.isCallAvailable;
    if (this.voxbayDetails != null) {
      data['voxbay_details'] = this.voxbayDetails!.toJson();
    }
    return data;
  }
}

class VoxbayDetails {
  int? id;
  int? staff;
  StaffDetails? staffDetails;
  String? didNo;
  String? empCode;
  String? extNo;
  String? createdAt;
  bool? isActive;

  VoxbayDetails(
      {this.id,
        this.staff,
        this.staffDetails,
        this.didNo,
        this.empCode,
        this.extNo,
        this.createdAt,
        this.isActive});

  VoxbayDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staff = json['staff'];
    staffDetails = json['staff_details'] != null
        ? new StaffDetails.fromJson(json['staff_details'])
        : null;
    didNo = json['did_no'];
    empCode = json['emp_code'];
    extNo = json['ext_no'];
    createdAt = json['created_at'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['staff'] = this.staff;
    if (this.staffDetails != null) {
      data['staff_details'] = this.staffDetails!.toJson();
    }
    data['did_no'] = this.didNo;
    data['emp_code'] = this.empCode;
    data['ext_no'] = this.extNo;
    data['created_at'] = this.createdAt;
    data['is_active'] = this.isActive;
    return data;
  }
}

class StaffDetails {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? role;

  StaffDetails({this.id, this.name, this.email, this.mobileNumber, this.role});

  StaffDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['role'] = this.role;
    return data;
  }
}