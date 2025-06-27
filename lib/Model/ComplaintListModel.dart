class ComplaintListModel {
  String? status;
  String? message;
  List<Data>? data;

  ComplaintListModel({this.status, this.message, this.data});

  ComplaintListModel.fromJson(Map<String, dynamic> json) {
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
  int? user;
  String? userName;
  String? userRole;
  String? complaints;
  String? createdAt;

  Data(
      {this.id,
        this.user,
        this.userName,
        this.userRole,
        this.complaints,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userName = json['user_name'];
    userRole = json['user_role'];
    complaints = json['complaints'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['user_name'] = this.userName;
    data['user_role'] = this.userRole;
    data['complaints'] = this.complaints;
    data['created_at'] = this.createdAt;
    return data;
  }
}