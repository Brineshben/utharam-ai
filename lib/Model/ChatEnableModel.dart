class PatientchatListModel {
  String? status;
  String? message;
  List<Data>? data;

  PatientchatListModel({this.status, this.message, this.data});

  PatientchatListModel.fromJson(Map<String, dynamic> json) {
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
  String? patientId;
  bool? chatEnabled;
  String? mobileNumber;

  Data(
      {this.id,
        this.name,
        this.email,
        this.patientId,
        this.chatEnabled,
        this.mobileNumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    patientId = json['patient_id'];
    chatEnabled = json['chat_enabled'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['patient_id'] = this.patientId;
    data['chat_enabled'] = this.chatEnabled;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}