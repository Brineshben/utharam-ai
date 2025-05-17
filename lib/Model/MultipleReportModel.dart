class MultipleReportsModel {
  String? status;
  String? message;
  List<PreliminaryDiagnoses>? preliminaryDiagnoses;
  List<SecondaryDiagnoses>? secondaryDiagnoses;
  List<GeneralChats>? generalChats;

  MultipleReportsModel(
      {this.status,
        this.message,
        this.preliminaryDiagnoses,
        this.secondaryDiagnoses,
        this.generalChats});

  MultipleReportsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['preliminary_diagnoses'] != null) {
      preliminaryDiagnoses = <PreliminaryDiagnoses>[];
      json['preliminary_diagnoses'].forEach((v) {
        preliminaryDiagnoses!.add(new PreliminaryDiagnoses.fromJson(v));
      });
    }
    if (json['secondary_diagnoses'] != null) {
      secondaryDiagnoses = <SecondaryDiagnoses>[];
      json['secondary_diagnoses'].forEach((v) {
        secondaryDiagnoses!.add(new SecondaryDiagnoses.fromJson(v));
      });
    }
    if (json['general_chats'] != null) {
      generalChats = <GeneralChats>[];
      json['general_chats'].forEach((v) {
        generalChats!.add(new GeneralChats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.preliminaryDiagnoses != null) {
      data['preliminary_diagnoses'] =
          this.preliminaryDiagnoses!.map((v) => v.toJson()).toList();
    }
    if (this.secondaryDiagnoses != null) {
      data['secondary_diagnoses'] =
          this.secondaryDiagnoses!.map((v) => v.toJson()).toList();
    }
    if (this.generalChats != null) {
      data['general_chats'] =
          this.generalChats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreliminaryDiagnoses {
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

  PreliminaryDiagnoses(
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

  PreliminaryDiagnoses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    if (json['chat_history'] != null) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(new ChatHistory.fromJson(v));
      });
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

  AiReport({this.sessionId, this.patientReport, this.therapistReport});

  AiReport.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    patientReport = json['patient_report'] != null
        ? new PatientReport.fromJson(json['patient_report'])
        : null;
    therapistReport = json['therapist_report'] != null
        ? new TherapistReport.fromJson(json['therapist_report'])
        : null;
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

class SecondaryDiagnoses {
  int? id;
  int? user;
  String? userEmail;
  String? userName;
  String? userRole;
  Null? chatSessionId;
  String? chatHistory;
  String? createdAt;
  AiReport? aiReport;
  bool? isPreliminary;
  String? aiSummaryFile;
  bool? isApproved;
  Null? aiReportUrl;
  String? aiPatientSummaryFile;

  SecondaryDiagnoses(
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

  SecondaryDiagnoses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    chatHistory = json['chat_history'];
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
    data['chat_history'] = this.chatHistory;
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

class AiReports {
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

  AiReports(
      {this.severity,
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

  AiReports.fromJson(Map<String, dynamic> json) {
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

class GeneralChats {
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
  Null? aiSummaryFile;
  bool? isApproved;
  Null? aiReportUrl;
  Null? aiPatientSummaryFile;

  GeneralChats(
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

  GeneralChats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    userEmail = json['user_email'];
    userName = json['user_name'];
    userRole = json['user_role'];
    chatSessionId = json['chat_session_id'];
    if (json['chat_history'] != null) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(new ChatHistory.fromJson(v));
      });
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

class PatientReports {
  String? patientSummary;
  String? physicalSymptoms;
  String? cognitiveSymptoms;
  String? emotionalSymptoms;
  String? behavioralSymptoms;

  PatientReports(
      {this.patientSummary,
        this.physicalSymptoms,
        this.cognitiveSymptoms,
        this.emotionalSymptoms,
        this.behavioralSymptoms});

  PatientReports.fromJson(Map<String, dynamic> json) {
    patientSummary = json['patient_summary'];
    physicalSymptoms = json['physical_symptoms'];
    cognitiveSymptoms = json['cognitive_symptoms'];
    emotionalSymptoms = json['emotional_symptoms'];
    behavioralSymptoms = json['behavioral_symptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_summary'] = this.patientSummary;
    data['physical_symptoms'] = this.physicalSymptoms;
    data['cognitive_symptoms'] = this.cognitiveSymptoms;
    data['emotional_symptoms'] = this.emotionalSymptoms;
    data['behavioral_symptoms'] = this.behavioralSymptoms;
    return data;
  }
}