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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
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
    if (json['patient_diagnosis'] != null) {
      patientDiagnosis = <PatientDiagnosis>[];
      json['patient_diagnosis'].forEach((v) {
        patientDiagnosis!.add(PatientDiagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (doctor != null) data['doctor'] = doctor!.toJson();
    if (patient != null) data['patient'] = patient!.toJson();
    data['assigned_at'] = assignedAt;
    data['status'] = status;
    if (patientDiagnosis != null) {
      data['patient_diagnosis'] =
          patientDiagnosis!.map((v) => v.toJson()).toList();
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
  bool? status;

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
    this.status,
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
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['medical_report'] = medicalReport;
    data['medical_report_url'] = medicalReportUrl;
    data['role'] = role;
    data['age'] = age;
    data['gender'] = gender;
    data['occupation'] = occupation;
    data['education'] = education;
    data['address'] = address;
    data['patient_id'] = patientId;
    data['verified'] = verified;
    data['chat_enabled'] = chatEnabled;
    data['is_call_available'] = isCallAvailable;
    data['status'] = status;
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
  bool? status;

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
    this.status,
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
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['medical_report'] = medicalReport;
    data['medical_report_url'] = medicalReportUrl;
    data['role'] = role;
    data['age'] = age;
    data['gender'] = gender;
    data['occupation'] = occupation;
    data['education'] = education;
    data['address'] = address;
    data['patient_id'] = patientId;
    data['verified'] = verified;
    data['chat_enabled'] = chatEnabled;
    data['is_call_available'] = isCallAvailable;
    data['status'] = status;
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
  String? chatHistory; // Fixed: String type
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

    // ✅ Fixed: If chat_history is a list, join it to a string
    var history = json['chat_history'];
    chatHistory = history is List
        ? history.join('\n')
        : history?.toString();

    createdAt = json['created_at'];
    aiReport =
    json['ai_report'] != null ? AiReport.fromJson(json['ai_report']) : null;
    isPreliminary = json['is_preliminary'];
    aiSummaryFile = json['ai_summary_file'];
    isApproved = json['is_approved'];
    aiReportUrl = json['ai_report_url'];
    aiPatientSummaryFile = json['ai_patient_summary_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user'] = user;
    data['user_email'] = userEmail;
    data['user_name'] = userName;
    data['user_role'] = userRole;
    data['chat_session_id'] = chatSessionId;
    data['chat_history'] = chatHistory; // ✅ remains a string
    data['created_at'] = createdAt;
    if (aiReport != null) data['ai_report'] = aiReport!.toJson();
    data['is_preliminary'] = isPreliminary;
    data['ai_summary_file'] = aiSummaryFile;
    data['is_approved'] = isApproved;
    data['ai_report_url'] = aiReportUrl;
    data['ai_patient_summary_file'] = aiPatientSummaryFile;
    return data;
  }
}

class AiReport {
  PatientReport? patientReport;
  TherapistReport? therapistReport;

  AiReport({this.patientReport, this.therapistReport});

  AiReport.fromJson(Map<String, dynamic> json) {
    patientReport = json['patient_report'] != null
        ? PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? TherapistReport.fromJson(json['therapist_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (patientReport != null) data['patient_report'] = patientReport!.toJson();
    if (therapistReport != null) data['therapist_report'] = therapistReport!.toJson();
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
    data['patient_summary'] = patientSummary;
    data['physical_symptoms'] = physicalSymptoms;
    data['cognitive_symptoms'] = cognitiveSymptoms;
    data['emotional_symptoms'] = emotionalSymptoms;
    data['behavioral_symptoms'] = behavioralSymptoms;
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
    data['severity'] = severity;
    data['substance_use'] = substanceUse;
    data['family_history'] = familyHistory;
    data['medical_history'] = medicalHistory;
    data['suicidality_risk'] = suicidalityRisk;
    data['disease_diagnosed'] = diseaseDiagnosed;
    data['psychiatric_history'] = psychiatricHistory;
    data['supporting_rag_line'] = supportingRagLine;
    data['presenting_complaints'] = presentingComplaints;
    data['data_sufficiency_check'] = dataSufficiencyCheck;
    data['mood_cognition_thought'] = moodCognitionThought;
    data['patient_goals_expectations'] = patientGoalsExpectations;
    data['suicidality_severity_score'] = suicidalitySeverityScore;
    return data;
  }
}
