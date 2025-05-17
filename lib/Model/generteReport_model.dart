class GenerateReportModel {
  String? status;
  String? message;
  String? fileUrl;

  GenerateReportModel({this.status, this.message, this.fileUrl});

  GenerateReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    fileUrl = json['summary_file_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['summary_file_url'] = this.fileUrl;
    return data;
  }
}