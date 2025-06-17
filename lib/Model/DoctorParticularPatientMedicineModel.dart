class DoctorParticularPatientmedicineModel {
  String? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  DoctorParticularPatientmedicineModel({this.status, this.statusCode, this.message, this.data});

  DoctorParticularPatientmedicineModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
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
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  List<Medicines>? medicines;

  Data({this.date, this.medicines});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  int? id;
  String? strength;
  String? dosage;
  String? uom;
  String? route;
  String? remarks;
  int? period;
  int? quantity;
  bool? isActive;
  String? dateTime;
  int? patient;
  String? brand;
  String? medicine;
  String? frequency;
  String? patientName;
  String? patientId;

  Medicines(
      {this.id,
        this.strength,
        this.dosage,
        this.uom,
        this.route,
        this.remarks,
        this.period,
        this.quantity,
        this.isActive,
        this.dateTime,
        this.patient,
        this.brand,
        this.medicine,
        this.frequency,
        this.patientName,
        this.patientId});

  Medicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    strength = json['strength'];
    dosage = json['dosage'];
    uom = json['uom'];
    route = json['route'];
    remarks = json['remarks'];
    period = json['period'];
    quantity = json['quantity'];
    isActive = json['is_active'];
    dateTime = json['date_time'];
    patient = json['patient'];
    brand = json['brand'];
    medicine = json['medicine'];
    frequency = json['frequency'];
    patientName = json['patient_name'];
    patientId = json['patient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['strength'] = this.strength;
    data['dosage'] = this.dosage;
    data['uom'] = this.uom;
    data['route'] = this.route;
    data['remarks'] = this.remarks;
    data['period'] = this.period;
    data['quantity'] = this.quantity;
    data['is_active'] = this.isActive;
    data['date_time'] = this.dateTime;
    data['patient'] = this.patient;
    data['brand'] = this.brand;
    data['medicine'] = this.medicine;
    data['frequency'] = this.frequency;
    data['patient_name'] = this.patientName;
    data['patient_id'] = this.patientId;
    return data;
  }
}