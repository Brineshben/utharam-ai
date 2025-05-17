class CallHumanModel {
  String? status;
  List<Data>? data;

  CallHumanModel({this.status, this.data});

  CallHumanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? callId;
  int? doctorId;
  String? doctorName;
  String? doctorRole;
  String? isActive;

  Data(
      {this.callId,
        this.doctorId,
        this.doctorName,
        this.doctorRole,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    callId = json['call_id'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorRole = json['doctor_role'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['call_id'] = this.callId;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['doctor_role'] = this.doctorRole;
    data['is_active'] = this.isActive;
    return data;
  }
}