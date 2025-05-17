class AddDoctortoPatientModel {
  String? message;
  Data? data;

  AddDoctortoPatientModel({this.message, this.data});

  AddDoctortoPatientModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? assignedAt;
  List<PatientDiagnosis>? patientDiagnosis;

  Data(
      {this.id,
        this.doctor,
        this.patient,
        this.assignedAt,
        this.patientDiagnosis});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    assignedAt = json['assigned_at'];
    if (json['patient_diagnosis'] != null) {
      patientDiagnosis = <PatientDiagnosis>[];
      json['patient_diagnosis'].forEach((v) {
        patientDiagnosis!.add(new PatientDiagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['assigned_at'] = this.assignedAt;
    if (this.patientDiagnosis != null) {
      data['patient_diagnosis'] =
          this.patientDiagnosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  String? username;
  String? email;
  String? mobileNumber;
  Null? medicalReport;
  Null? medicalReportUrl;
  String? role;
  int? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;
  Null? patientId;

  Doctor(
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
        this.patientId});

  Doctor.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Patient {
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

  Patient(
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
        this.patientId});

  Patient.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class PatientDiagnosis {
  int? id;
  String? chatSessionId;
  String? diagnosisSummary;
  String? chatHistory;
  String? createdAt;
  String? severity;
  int? user;

  PatientDiagnosis(
      {this.id,
        this.chatSessionId,
        this.diagnosisSummary,
        this.chatHistory,
        this.createdAt,
        this.severity,
        this.user});

  PatientDiagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatSessionId = json['chat_session_id'];
    diagnosisSummary = json['diagnosis_summary'];
    chatHistory = json['chat_history'];
    createdAt = json['created_at'];
    severity = json['severity'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chat_session_id'] = this.chatSessionId;
    data['diagnosis_summary'] = this.diagnosisSummary;
    data['chat_history'] = this.chatHistory;
    data['created_at'] = this.createdAt;
    data['severity'] = this.severity;
    data['user'] = this.user;
    return data;
  }
}