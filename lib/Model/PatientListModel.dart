class PatientListModel {
  String? status;
  String? message;
  List<Data>? data;

  PatientListModel({this.status, this.message, this.data});

  PatientListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
  bool? status;
  List<PatientDiagnosis>? patientDiagnosis;

  Data({
    this.id,
    this.doctor,
    this.patient,
    this.assignedAt,
    this.status,
    this.patientDiagnosis,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    assignedAt = json['assigned_at'];
    status = json['status'];
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
    if (this.doctor != null) data['doctor'] = this.doctor!.toJson();
    if (this.patient != null) data['patient'] = this.patient!.toJson();
    data['assigned_at'] = this.assignedAt;
    data['status'] = this.status;
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
  bool? chatEnabled;
  bool? isCallAvailable;

  Doctor({
    this.id,
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
    this.verified,
    this.chatEnabled,
    this.isCallAvailable,
  });

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
    chatEnabled = json['chat_enabled'];
    isCallAvailable = json['is_call_available'];
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
    data['chat_enabled'] = this.chatEnabled;
    data['is_call_available'] = this.isCallAvailable;
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
  bool? chatEnabled;
  bool? isCallAvailable;

  Patient({
    this.id,
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
    this.verified,
    this.chatEnabled,
    this.isCallAvailable,
  });

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
    chatEnabled = json['chat_enabled'];
    isCallAvailable = json['is_call_available'];
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
    data['chat_enabled'] = this.chatEnabled;
    data['is_call_available'] = this.isCallAvailable;
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
  String? aiPatientSummaryFile;

  PatientDiagnosis({
    this.id,
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
    this.aiReportUrl,
    this.aiPatientSummaryFile,
  });

  PatientDiagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    if (json['chat_history'] != null && json['chat_history'] is List) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    aiReport = json['ai_report'] != null ? AiReport.fromJson(json['ai_report']) : null;
    isPreliminary = json['is_preliminary'];
    aiSummaryFile = json['ai_summary_file'];
    isApproved = json['is_approved'];
    aiReportUrl = json['ai_report_url'];
    aiPatientSummaryFile = json['ai_patient_summary_file'];
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
    data['ai_patient_summary_file'] = this.aiPatientSummaryFile;
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
    if (this.patientReport != null) data['patient_report'] = this.patientReport!.toJson();
    if (this.therapistReport != null) data['therapist_report'] = this.therapistReport!.toJson();
    return data;
  }
}

class PatientReport {
  String? patientSummary;
  String? physicalSymptoms;
  String? cognitiveSymptoms;
  String? emotionalSymptoms;
  String? behavioralSymptoms;

  PatientReport({
    this.patientSummary,
    this.physicalSymptoms,
    this.cognitiveSymptoms,
    this.emotionalSymptoms,
    this.behavioralSymptoms,
  });

  PatientReport.fromJson(Map<String, dynamic> json) {
    patientSummary = json['patient_summary'];
    physicalSymptoms = json['physical_symptoms'];
    cognitiveSymptoms = json['cognitive_symptoms'];
    emotionalSymptoms = json['emotional_symptoms'];
    behavioralSymptoms = json['behavioral_symptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['patient_summary'] = this.patientSummary;
    data['physical_symptoms'] = this.physicalSymptoms;
    data['cognitive_symptoms'] = this.cognitiveSymptoms;
    data['emotional_symptoms'] = this.emotionalSymptoms;
    data['behavioral_symptoms'] = this.behavioralSymptoms;
    return data;
  }
}

class TherapistReport {
  int? severity;
  String? substanceUse;
  String? familyHistory;
  String? medicalHistory;
  String? suicidalityRisk;
  String? diseaseDiagnosed;
  String? psychiatricHistory;
  String? supportingRagLine;
  String? presentingComplaints;
  String? dataSufficiencyCheck;
  String? moodCognitionThought;
  String? patientGoalsExpectations;
  int? suicidalitySeverityScore;

  TherapistReport({
    this.severity,
    this.substanceUse,
    this.familyHistory,
    this.medicalHistory,
    this.suicidalityRisk,
    this.diseaseDiagnosed,
    this.psychiatricHistory,
    this.supportingRagLine,
    this.presentingComplaints,
    this.dataSufficiencyCheck,
    this.moodCognitionThought,
    this.patientGoalsExpectations,
    this.suicidalitySeverityScore,
  });

  TherapistReport.fromJson(Map<String, dynamic> json) {
    severity = json['severity'];
    substanceUse = json['substance_use'];
    familyHistory = json['family_history'];
    medicalHistory = json['medical_history'];
    suicidalityRisk = json['suicidality_risk'];
    diseaseDiagnosed = json['disease_diagnosed'];
    psychiatricHistory = json['psychiatric_history'];
    supportingRagLine = json['supporting_rag_line'];
    presentingComplaints = json['presenting_complaints'];
    dataSufficiencyCheck = json['data_sufficiency_check'];
    moodCognitionThought = json['mood_cognition_thought'];
    patientGoalsExpectations = json['patient_goals_expectations'];
    suicidalitySeverityScore = json['suicidality_severity_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['severity'] = this.severity;
    data['substance_use'] = this.substanceUse;
    data['family_history'] = this.familyHistory;
    data['medical_history'] = this.medicalHistory;
    data['suicidality_risk'] = this.suicidalityRisk;
    data['disease_diagnosed'] = this.diseaseDiagnosed;
    data['psychiatric_history'] = this.psychiatricHistory;
    data['supporting_rag_line'] = this.supportingRagLine;
    data['presenting_complaints'] = this.presentingComplaints;
    data['data_sufficiency_check'] = this.dataSufficiencyCheck;
    data['mood_cognition_thought'] = this.moodCognitionThought;
    data['patient_goals_expectations'] = this.patientGoalsExpectations;
    data['suicidality_severity_score'] = this.suicidalitySeverityScore;
    return data;
  }
}
