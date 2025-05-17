class LoginModel {
  String? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? email;
  String? name;
  String? role;
  String? accessToken;
  String? refreshToken;
  String? patientId;
  String? registeredDate;
  bool? firstTime;
  String? isVerified;

  Data(
      {this.userId,
        this.email,
        this.name,
        this.role,
        this.accessToken,
        this.refreshToken,
        this.patientId,
        this.registeredDate,
        this.firstTime,
        this.isVerified});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    patientId = json['patient_id'];
    registeredDate = json['registered_date'];
    firstTime = json['first_time'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['patient_id'] = this.patientId;
    data['registered_date'] = this.registeredDate;
    data['first_time'] = this.firstTime;
    data['is_verified'] = this.isVerified;
    return data;
  }
}