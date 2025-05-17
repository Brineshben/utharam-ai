import 'package:flutter/cupertino.dart';
import 'package:patient/Model/Medicine_model/BrandModel.dart';
import 'package:patient/Model/Medicine_model/Frequency_Model.dart';
import 'package:patient/Model/Medicine_model/Medicine_List_Model.dart';

class AddMedicineModel {
  int? patient;
  List<Medicines>? medicines;

  AddMedicineModel({this.patient, this.medicines});

  AddMedicineModel.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient'] = this.patient;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  int? brand;
  int? medicine;
  int? frequency;
  String? strength;
  String? dosage;
  String? uom;
  String? route;
  String? remarks;
  String? period;
  String? quantity;
  bool? isActive;

  Medicines(
      {this.brand,
        this.medicine,
        this.frequency,
        this.strength,
        this.dosage,
        this.uom,
        this.route,
        this.remarks,
        this.period,
        this.quantity,
        this.isActive});

  Medicines.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    medicine = json['medicine'];
    frequency = json['frequency'];
    strength = json['strength'];
    dosage = json['dosage'];
    uom = json['uom'];
    route = json['route'];
    remarks = json['remarks'];
    period = json['period'];
    quantity = json['quantity'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['medicine'] = this.medicine;
    data['frequency'] = this.frequency;
    data['strength'] = this.strength;
    data['dosage'] = this.dosage;
    data['uom'] = this.uom;
    data['route'] = this.route;
    data['remarks'] = this.remarks;
    data['period'] = this.period;
    data['quantity'] = this.quantity;
    data['is_active'] = this.isActive;
    return data;
  }
}

class MedicinesList {
  BrandData? brand;
  MedicineData? medicine;
  FrequencyData? frequency;
  String? strength;
  String? dosage;
  String? uom;
  String? route;
  String? remarks;
  String? period;
  String? quantity;
  bool? isActive;

  MedicinesList(
      {this.brand,
        this.medicine,
        this.frequency,
        this.strength,
        this.dosage,
        this.uom,
        this.route,
        this.remarks,
        this.period,
        this.quantity,
        this.isActive});
}