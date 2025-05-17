class PatientDetails {
  String? status;
  String? message;
  User? user;

  PatientDetails({this.status, this.message, this.user});

  PatientDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
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

  User({
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
  });

  User.fromJson(Map<String, dynamic> json) {
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
    if (json['diagnosis'] != null) {
      diagnosis = <Diagnosis>[];
      json['diagnosis'].forEach((v) {
        diagnosis!.add(Diagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
    if (diagnosis != null) {
      data['diagnosis'] = diagnosis!.map((v) => v.toJson()).toList();
    }
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
  String? chatHistory;
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

    var rawHistory = json['chat_history'];
    chatHistory = rawHistory is List ? rawHistory.join('\n') : rawHistory;

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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['user_email'] = userEmail;
    data['user_name'] = userName;
    data['user_role'] = userRole;
    data['chat_session_id'] = chatSessionId;
    data['chat_history'] = chatHistory;
    data['created_at'] = createdAt;
    if (aiReport != null) {
      data['ai_report'] = aiReport!.toJson();
    }
    data['is_preliminary'] = isPreliminary;
    data['ai_summary_file'] = aiSummaryFile;
    data['is_approved'] = isApproved;
    data['ai_report_url'] = aiReportUrl;
    data['ai_patient_summary_file'] = aiPatientSummaryFile;
    return data;
  }
}

class AiReport {
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
  String? sessionId;
  PatientReport? patientReport;
  TherapistReport? therapistReport;

  AiReport({
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
    this.sessionId,
    this.patientReport,
    this.therapistReport,
  });

  AiReport.fromJson(Map<String, dynamic> json) {
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
    sessionId = json['session_id'];
    patientReport = json['patient_report'] != null
        ? PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? TherapistReport.fromJson(json['therapist_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['severity'] = severity;
    data['substance_use'] = substanceUse;
    data['family_history'] = familyHistory;
    data['medical_history'] = medicalHistory;
    data['patient_summary'] = patientSummary;
    data['suicidality_risk'] = suicidalityRisk;
    data['disease_diagnosed'] = diseaseDiagnosed;
    data['therapy_next_steps'] = therapyNextSteps;
    data['psychiatric_history'] = psychiatricHistory;
    data['supporting_rag_line'] = supportingRagLine;
    data['presenting_complaints'] = presentingComplaints;
    data['data_sufficiency_check'] = dataSufficiencyCheck;
    data['mood_cognition_thought'] = moodCognitionThought;
    data['wellness_recommendations'] = wellnessRecommendations;
    data['emotional_support_message'] = emotionalSupportMessage;
    data['suicidality_severity_score'] = suicidalitySeverityScore;
    data['session_id'] = sessionId;
    if (patientReport != null) {
      data['patient_report'] = patientReport!.toJson();
    }
    if (therapistReport != null) {
      data['therapist_report'] = therapistReport!.toJson();
    }
    return data;
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
    final data = <String, dynamic>{};
    data['patient_summary'] = patientSummary;
    data['therapy_next_steps'] = therapyNextSteps;
    data['wellness_recommendations'] = wellnessRecommendations;
    data['emotional_support_message'] = emotionalSupportMessage;
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
    final data = <String, dynamic>{};
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
