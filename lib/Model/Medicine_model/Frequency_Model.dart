class FrequencyModel {
  String? status;
  String? message;
  List<FrequencyData>? data;

  FrequencyModel({this.status, this.message, this.data});

  FrequencyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FrequencyData>[];
      json['data'].forEach((v) {
        data!.add(new FrequencyData.fromJson(v));
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

class FrequencyData {
  int? id;
  String? name;

  FrequencyData({this.id, this.name});

  FrequencyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}