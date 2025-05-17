class ParticularMedicineListModel {
  String? status;
  String? message;
  int? count;
  List<Data>? data;

  ParticularMedicineListModel(
      {this.status, this.message, this.count, this.data});

  ParticularMedicineListModel.fromJson(Map<String, dynamic> json) {
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

  Data(
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
        this.frequency});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}