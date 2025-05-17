class SheduleModel {
  String? status;
  String? message;
  List<Data>? data;

  SheduleModel({this.status, this.message, this.data});

  SheduleModel.fromJson(Map<String, dynamic> json) {
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
  int? doctor;
  String? doctorName;
  String? doctorRole;
  int? patient;
  String? patientId;
  String? patientName;
  AiSummary? aiSummary;
  String? session;
  String? observations;
  bool? isActive;
  String? assignedAt;

  Data(
      {this.id,
        this.doctor,
        this.doctorName,
        this.doctorRole,
        this.patient,
        this.patientId,
        this.patientName,
        this.aiSummary,
        this.session,
        this.observations,
        this.isActive,
        this.assignedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    doctorName = json['doctor_name'];
    doctorRole = json['doctor_role'];
    patient = json['patient'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    aiSummary = json['ai_summary'] != null
        ? new AiSummary.fromJson(json['ai_summary'])
        : null;
    session = json['session'];
    observations = json['observations'];
    isActive = json['is_active'];
    assignedAt = json['assigned_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor'] = this.doctor;
    data['doctor_name'] = this.doctorName;
    data['doctor_role'] = this.doctorRole;
    data['patient'] = this.patient;
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    if (this.aiSummary != null) {
      data['ai_summary'] = this.aiSummary!.toJson();
    }
    data['session'] = this.session;
    data['observations'] = this.observations;
    data['is_active'] = this.isActive;
    data['assigned_at'] = this.assignedAt;
    return data;
  }
}

class AiSummary {
  String? sessionId;
  PatientReport? patientReport;
  TherapistReport? therapistReport;

  AiSummary({this.sessionId, this.patientReport, this.therapistReport});

  AiSummary.fromJson(Map<String, dynamic> json) {
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