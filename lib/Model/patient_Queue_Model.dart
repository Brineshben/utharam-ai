class PatientQueueModel {
  String? status;
  String? message;
  List<Data>? data;

  PatientQueueModel({this.status, this.message, this.data});

  PatientQueueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] is List) {
      data = (json['data'] as List)
          .map((v) => Data.fromJson(v as Map<String, dynamic>))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((v) => v.toJson()).toList(),
    };
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

  Data({
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
    this.diagnosis,
    this.hasSecondAssessment,
  });

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
    if (json['diagnosis'] is List) {
      diagnosis = (json['diagnosis'] as List)
          .map((v) => Diagnosis.fromJson(v as Map<String, dynamic>))
          .toList();
    }
    hasSecondAssessment = json['has_second_assessment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'mobile_number': mobileNumber,
      'medical_report': medicalReport,
      'medical_report_url': medicalReportUrl,
      'role': role,
      'age': age,
      'gender': gender,
      'occupation': occupation,
      'education': education,
      'address': address,
      'patient_id': patientId,
      'verified': verified,
      'chat_enabled': chatEnabled,
      'diagnosis': diagnosis?.map((v) => v.toJson()).toList(),
      'has_second_assessment': hasSecondAssessment,
    };
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

  Diagnosis({
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

  Diagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    if (json['chat_history'] is List) {
      chatHistory = (json['chat_history'] as List)
          .map((v) => ChatHistory.fromJson(v as Map<String, dynamic>))
          .toList();
    }
    createdAt = json['created_at'];
    aiReport = json['ai_report'] != null
        ? AiReport.fromJson(json['ai_report'])
        : null;
    isPreliminary = json['is_preliminary'];
    aiSummaryFile = json['ai_summary_file'];
    isApproved = json['is_approved'];
    aiReportUrl = json['ai_report_url'];
    aiPatientSummaryFile = json['ai_patient_summary_file'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'user_email': userEmail,
      'user_name': userName,
      'user_role': userRole,
      'chat_session_id': chatSessionId,
      'chat_history': chatHistory?.map((v) => v.toJson()).toList(),
      'created_at': createdAt,
      'ai_report': aiReport?.toJson(),
      'is_preliminary': isPreliminary,
      'ai_summary_file': aiSummaryFile,
      'is_approved': isApproved,
      'ai_report_url': aiReportUrl,
      'ai_patient_summary_file': aiPatientSummaryFile,
    };
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
    return {
      'role': role,
      'content': content,
    };
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

  AiReport({
    this.sessionId,
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
    this.suicidalitySeverityScore,
  });

  AiReport.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    patientReport = json['patient_report'] != null
        ? PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? TherapistReport.fromJson(json['therapist_report'])
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
    return {
      'session_id': sessionId,
      'patient_report': patientReport?.toJson(),
      'therapist_report': therapistReport?.toJson(),
      'severity': severity,
      'substance_use': substanceUse,
      'family_history': familyHistory,
      'medical_history': medicalHistory,
      'patient_summary': patientSummary,
      'suicidality_risk': suicidalityRisk,
      'disease_diagnosed': diseaseDiagnosed,
      'therapy_next_steps': therapyNextSteps,
      'psychiatric_history': psychiatricHistory,
      'supporting_rag_line': supportingRagLine,
      'presenting_complaints': presentingComplaints,
      'data_sufficiency_check': dataSufficiencyCheck,
      'mood_cognition_thought': moodCognitionThought,
      'wellness_recommendations': wellnessRecommendations,
      'emotional_support_message': emotionalSupportMessage,
      'suicidality_severity_score': suicidalitySeverityScore,
    };
  }
}

class PatientReport {
  String? patientSummary;
  String? therapyNextSteps;
  String? wellnessRecommendations;
  String? emotionalSupportMessage;

  PatientReport({
    this.patientSummary,
    this.therapyNextSteps,
    this.wellnessRecommendations,
    this.emotionalSupportMessage,
  });

  PatientReport.fromJson(Map<String, dynamic> json) {
    patientSummary = json['patient_summary'];
    therapyNextSteps = json['therapy_next_steps'];
    wellnessRecommendations = json['wellness_recommendations'];
    emotionalSupportMessage = json['emotional_support_message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'patient_summary': patientSummary,
      'therapy_next_steps': therapyNextSteps,
      'wellness_recommendations': wellnessRecommendations,
      'emotional_support_message': emotionalSupportMessage,
    };
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
    return {
      'severity': severity,
      'substance_use': substanceUse,
      'family_history': familyHistory,
      'medical_history': medicalHistory,
      'suicidality_risk': suicidalityRisk,
      'disease_diagnosed': diseaseDiagnosed,
      'psychiatric_history': psychiatricHistory,
      'supporting_rag_line': supportingRagLine,
      'presenting_complaints': presentingComplaints,
      'data_sufficiency_check': dataSufficiencyCheck,
      'mood_cognition_thought': moodCognitionThought,
      'patient_goals_expectations': patientGoalsExpectations,
      'suicidality_severity_score': suicidalitySeverityScore,
    };
  }
}