class ReportsPatientModel {
  String? status;
  String? message;
  List<Data>? data;

  ReportsPatientModel({this.status, this.message, this.data});

  ReportsPatientModel.fromJson(Map<String, dynamic> json) {
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
  DoctorDetails? doctorDetails;
  PatientDetails? patientDetails;
  SlotDetails? slotDetails;
  String? date;
  int? doctor;
  int? patient;
  int? slot;

  Data(
      {this.id,
        this.doctorDetails,
        this.patientDetails,
        this.slotDetails,
        this.date,
        this.doctor,
        this.patient,
        this.slot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorDetails = json['doctor_details'] != null
        ? new DoctorDetails.fromJson(json['doctor_details'])
        : null;
    patientDetails = json['patient_details'] != null
        ? new PatientDetails.fromJson(json['patient_details'])
        : null;
    slotDetails = json['slot_details'] != null
        ? new SlotDetails.fromJson(json['slot_details'])
        : null;
    date = json['date'];
    doctor = json['doctor'];
    patient = json['patient'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.doctorDetails != null) {
      data['doctor_details'] = this.doctorDetails!.toJson();
    }
    if (this.patientDetails != null) {
      data['patient_details'] = this.patientDetails!.toJson();
    }
    if (this.slotDetails != null) {
      data['slot_details'] = this.slotDetails!.toJson();
    }
    data['date'] = this.date;
    data['doctor'] = this.doctor;
    data['patient'] = this.patient;
    data['slot'] = this.slot;
    return data;
  }
}

class DoctorDetails {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;

  DoctorDetails({this.id, this.name, this.email, this.mobileNumber});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}

class PatientDetails {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? patientIdMetro;

  PatientDetails(
      {this.id, this.name, this.email, this.mobileNumber, this.patientIdMetro});

  PatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    patientIdMetro = json['patient_id_metro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['patient_id_metro'] = this.patientIdMetro;
    return data;
  }
}

class SlotDetails {
  int? id;
  String? date;
  String? fromTime;
  String? toTime;

  SlotDetails({this.id, this.date, this.fromTime, this.toTime});

  SlotDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    return data;
  }
}