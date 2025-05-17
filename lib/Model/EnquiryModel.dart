class Enquirylist {
  String? status;
  String? message;
  List<Data>? data;

  Enquirylist({this.status, this.message, this.data});

  Enquirylist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null && json['data'] is List) {
      data = <Data>[];
      (json['data'] as List).forEach((v) {
        data!.add(Data.fromJson(v));
      });
    } else {
      data = [];
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
  List<Diagnosis>? diagnosis;
  bool? hasSecondAssessment;

  Data(
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
        this.verified,
        this.chatEnabled,
        this.diagnosis,
        this.hasSecondAssessment});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['diagnosis'] != null && json['diagnosis'] is List) {
      diagnosis = <Diagnosis>[];
      json['diagnosis'].forEach((v) {
        diagnosis!.add(Diagnosis.fromJson(v));
      });
    } else {
      diagnosis = [];
    }
    hasSecondAssessment = json['has_second_assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis!.map((v) => v.toJson()).toList();
    }
    data['has_second_assessment'] = this.hasSecondAssessment;
    return data;
  }
}

class Diagnosis {
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

  Diagnosis(
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
        this.aiReportUrl,
        this.aiPatientSummaryFile});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    if (json['chat_history'] != null && json['chat_history'] is List) {
      chatHistory = <ChatHistory>[];
      (json['chat_history'] as List).forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    } else {
      chatHistory = [];
    }
    createdAt = json['created_at'];
    aiReport = json['ai_report'] != null
        ? new AiReport.fromJson(json['ai_report'])
        : null;
    isPreliminary = json['is_preliminary'];
    aiSummaryFile = json['ai_summary_file'];
    isApproved = json['is_approved'];
    aiReportUrl = json['ai_report_url'];
    aiPatientSummaryFile = json['ai_patient_summary_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['content'] = this.content;
    return data;
  }
}

class AiReport {
  String? sessionId;
  PatientReport? patientReport;
  TherapistReport? therapistReport;
  int? severity;
  String? substanceUse;
  String? familyHistory;
  String? medicalHistory;
  String? patientSummary;
  String? suicidalityRisk;
  String? diseaseDiagnosed;
  String? therapyNextSteps;
  String? psychiatricHistory;
  String? supportingRagLine;
  String? presentingComplaints;
  String? dataSufficiencyCheck;
  String? moodCognitionThought;
  String? wellnessRecommendations;
  String? emotionalSupportMessage;
  int? suicidalitySeverityScore;

  AiReport(
      {this.sessionId,
        this.patientReport,
        this.therapistReport,
        this.severity,
        this.substanceUse,
        this.familyHistory,
        this.medicalHistory,
        this.patientSummary,
        this.suicidalityRisk,
        this.diseaseDiagnosed,
        this.therapyNextSteps,
        this.psychiatricHistory,
        this.supportingRagLine,
        this.presentingComplaints,
        this.dataSufficiencyCheck,
        this.moodCognitionThought,
        this.wellnessRecommendations,
        this.emotionalSupportMessage,
        this.suicidalitySeverityScore});

  AiReport.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    patientReport = json['patient_report'] != null
        ? new PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? new TherapistReport.fromJson(json['therapist_report'])
        : null;
    severity = json['severity'];
    substanceUse = json['substance_use'];
    familyHistory = json['family_history'];
    medicalHistory = json['medical_history'];
    patientSummary = json['patient_summary'];
    suicidalityRisk = json['suicidality_risk'];
    diseaseDiagnosed = json['disease_diagnosed'];
    therapyNextSteps = json['therapy_next_steps'];
    psychiatricHistory = json['psychiatric_history'];
    supportingRagLine = json['supporting_rag_line'];
    presentingComplaints = json['presenting_complaints'];
    dataSufficiencyCheck = json['data_sufficiency_check'];
    moodCognitionThought = json['mood_cognition_thought'];
    wellnessRecommendations = json['wellness_recommendations'];
    emotionalSupportMessage = json['emotional_support_message'];
    suicidalitySeverityScore = json['suicidality_severity_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    if (this.patientReport != null) {
      data['patient_report'] = this.patientReport!.toJson();
    }
    if (this.therapistReport != null) {
      data['therapist_report'] = this.therapistReport!.toJson();
    }
    data['severity'] = this.severity;
    data['substance_use'] = this.substanceUse;
    data['family_history'] = this.familyHistory;
    data['medical_history'] = this.medicalHistory;
    data['patient_summary'] = this.patientSummary;
    data['suicidality_risk'] = this.suicidalityRisk;
    data['disease_diagnosed'] = this.diseaseDiagnosed;
    data['therapy_next_steps'] = this.therapyNextSteps;
    data['psychiatric_history'] = this.psychiatricHistory;
    data['supporting_rag_line'] = this.supportingRagLine;
    data['presenting_complaints'] = this.presentingComplaints;
    data['data_sufficiency_check'] = this.dataSufficiencyCheck;
    data['mood_cognition_thought'] = this.moodCognitionThought;
    data['wellness_recommendations'] = this.wellnessRecommendations;
    data['emotional_support_message'] = this.emotionalSupportMessage;
    data['suicidality_severity_score'] = this.suicidalitySeverityScore;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? suicidalityRisk;
  String? diseaseDiagnosed;
  String? psychiatricHistory;
  String? supportingRagLine;
  String? presentingComplaints;
  String? dataSufficiencyCheck;
  String? moodCognitionThought;
  String? patientGoalsExpectations;
  int? suicidalitySeverityScore;

  TherapistReport(
      {this.severity,
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
        this.suicidalitySeverityScore});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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