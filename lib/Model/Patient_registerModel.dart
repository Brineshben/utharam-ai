class RegisterPatient {
  String? status;
  String? message;
  User? user;

RegisterPatient({this.status, this.message, this.user});

RegisterPatient.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? mobileNumber;
  Null? medicalReport;
  Null? medicalReportUrl;
  String? role;
  String? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;

  User(
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
        this.address});

  User.fromJson(Map<String, dynamic> json) {
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
    return data;
   }
}