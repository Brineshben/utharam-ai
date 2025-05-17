class AssignedDoctorPatientListModel {
  String? status;
  String? message;
  List<Data>? data;

  AssignedDoctorPatientListModel({this.status, this.message, this.data});

  AssignedDoctorPatientListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    // Check if 'data' is a list before calling forEach
    if (json['data'] != null && json['data'] is List) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    patient =
    json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    assignedAt = json['assigned_at'];

    // Check if 'patient_diagnosis' is a list before calling forEach
    if (json['patient_diagnosis'] != null && json['patient_diagnosis'] is List) {
      patientDiagnosis = <PatientDiagnosis>[];
      json['patient_diagnosis'].forEach((v) {
        patientDiagnosis!.add(PatientDiagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
  String? medicalReport;
  String? medicalReportUrl;
  String? role;
  int? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;
  String? patientId;
  String? verified;

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
        this.patientId,
        this.verified});

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
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data['verified'] = this.verified;
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
  String? verified;

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
        this.patientId,
        this.verified});

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
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data['verified'] = this.verified;
    return data;
  }
}

class PatientDiagnosis {
  int? id;
  int? user;
  String? userEmail;
  String? userName;
  String? userRole;
  String? chatSessionId;
  List<ChatHistory>? chatHistory;
  String? createdAt;
  AiReport? aiReport;
  bool? isPreliminary;
  String? aiSummaryFile;
  bool? isApproved;
  String? aiReportUrl;

  PatientDiagnosis(
      {this.id,
        this.user,
        this.userEmail,
        this.userName,
        this.userRole,
        this.chatSessionId,
        this.chatHistory,
        this.createdAt,
        this.aiReport,
        this.isPreliminary,
        this.aiSummaryFile,
        this.isApproved,
        this.aiReportUrl});

  PatientDiagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];

    // Check if 'chat_history' is a list before calling forEach
    if (json['chat_history'] != null && json['chat_history'] is List) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    }

    createdAt = json['created_at'];
    aiReport = json['ai_report'] != null
        ? AiReport.fromJson(json['ai_report'])
        : null;
    isPreliminary = json['is_preliminary'];
    aiSummaryFile = json['ai_summary_file'];
    isApproved = json['is_approved'];
    aiReportUrl = json['ai_report_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['user'] = this.user;
    data['user_email'] = this.userEmail;
    data['user_name'] = this.userName;
    data['user_role'] = this.userRole;
    data['chat_session_id'] = this.chatSessionId;
    if (this.chatHistory != null) {
      data['chat_history'] = this.chatHistory!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    if (this.aiReport != null) {
      data['ai_report'] = this.aiReport!.toJson();
    }
    data['is_preliminary'] = this.isPreliminary;
    data['ai_summary_file'] = this.aiSummaryFile;
    data['is_approved'] = this.isApproved;
    data['ai_report_url'] = this.aiReportUrl;
    return data;
  }
}

class ChatHistory {
  String? role;
  String? content;

  ChatHistory({this.role, this.content});

  ChatHistory.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['role'] = this.role;
    data['content'] = this.content;
    return data;
  }
}

class AiReport {
  String? sessionId;
  PatientReport? patientReport;
  TherapistReport? therapistReport;

  AiReport({this.sessionId, this.patientReport, this.therapistReport});

  AiReport.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    patientReport = json['patient_report'] != null
        ? PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? TherapistReport.fromJson(json['therapist_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['session_id'] = this.sessionId;
    if (this.patientReport != null) {
      data['patient_report'] = this.patientReport!.toJson();
    }
    if (this.therapistReport != null) {
      data['therapist_report'] = this.therapistReport!.toJson();
    }
    return data;
  }
}

class PatientReport {
  String? patientSummary;
  String? therapyNextSteps;
  String? wellnessRecommendations;
  String? emotionalSupportMessage;

  PatientReport(
      {this.patientSummary,
        this.therapyNextSteps,
        this.wellnessRecommendations,
        this.emotionalSupportMessage});

  PatientReport.fromJson(Map<String, dynamic> json) {
    patientSummary = json['patient_summary'];
    therapyNextSteps = json['therapy_next_steps'];
    wellnessRecommendations = json['wellness_recommendations'];
    emotionalSupportMessage = json['emotional_support_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['patient_summary'] = this.patientSummary;
    data['therapy_next_steps'] = this.therapyNextSteps;
    data['wellness_recommendations'] = this.wellnessRecommendations;
    data['emotional_support_message'] = this.emotionalSupportMessage;
    return data;
  }
}

class TherapistReport {
  int? severity;
  String? substanceUse;
  String? familyHistory;
  String? medicalHistory;
  String?mentalState;

  TherapistReport(
      {this.severity,
        this.substanceUse,
        this.familyHistory,
        this.medicalHistory,
        this.mentalState});

  TherapistReport.fromJson(Map<String, dynamic> json) {
    severity = json['severity'];
    substanceUse = json['substance_use'];
    familyHistory = json['family_history'];
    medicalHistory = json['medical_history'];
    mentalState = json['mental_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['severity'] = this.severity;
    data['substance_use'] = this.substanceUse;
    data['family_history'] = this.familyHistory;
    data['medical_history'] = this.medicalHistory;
    data['mental_state'] = this.mentalState;
    return data;
  }
}

