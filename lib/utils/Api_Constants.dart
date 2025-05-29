class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }
///BaseURL
//   static String baseURL = "http://192.168.1.48:8001";
  static String baseURL = "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net";
  // static String baseURL = "http://192.168.1.29:8000";


  ///URLS
  static String login = "/accounts/login/";
  // static String chat = "/accounts/psychiatrist-chat/";
  static String chat = "/accounts/psychiatrist_chat/";
  static String registerPatient = "/accounts/register/";
  static String patientQueue = "/assign_doctor/new/patience/list/";
  static String doctorList = "/doctors/list/doctors/";
  static String consultDoctorList = "/doctors/list/consult/doctors/";
  static String addDoctorToPatient = "/assign_doctor/assign-doctor/";
  static String addSlot = "/booking/list/all/slots/";
  static String addDoctor = "/doctors/register/doctor/";
  static String addPatient = "/appointment/slots/filter/";
  static String addAppointment = "/appointment/appointment/create/";
  static String assignedDoctorAppointnmentList = "/accounts/toggle_call_assigning/";
  static String assignedDoctorAppointnmentList1 = "/assign_doctor/doctor/patients/list/";
  static String addObservation = "/doctor_observations/observation/create/";
  static String addTalktohumanlist= "/doctor_observations/observation/create/";
  static String sheduleModel = "/doctor_observations/doctor-observations/";
  static String juniorDashboard = "/counts/admin/dashboard/count/";
  static String seniorDashboard = "/counts/senior/dashboard/count/";
  static String quotes = "/accounts/quotes";
  static String medicineList = "/medicine/medicine/list/";
  static String brand = "/medicine/brand/list/";
  static String frequency = "/medicine/frequency/list/";
  static String sendOtp = "/accounts/send_otp/";
  static String checkOtp = "/accounts/check_otp/";
  static String sddMedicineList = "/medicine_assign/add-medicines/";
  static String particularMedicineList = "/medicine_assign/patient/medicine/list/";
  static String createAssignment = "/thoughts/thoughts/create/";
  static String editAssignment = "/thoughts/thoughts/update/";
  static String patientAssignmentList = "/thoughts/patient-thoughts/list/";
  static String diagnosisAdd = "/accounts/approve_ai_diagnosis_summary/";
  static String enquiredList = "/accounts/unverified-users/";
  static String approveEnquiredList = "/accounts/approve-user/";
  static String rejectEnquiredList = "/accounts/approve-user/";
  static String talkToHuman = "/accounts/available-doctors-patient/";
  static String generateReport = "/accounts/generate_pdf/";
  static String addAddon = "/doctor_observations/preliminary-addons/create/";
  static String patientDetails = "/accounts/user/detail/";
  static String addSecondAssesment = "/accounts/second-assessment-api/";
  static String enableChat = "/accounts/enable_chat_api/";
  static String reportPatientList = "/senior_function/assigned/patient/list/";
  static String multipleReports = "/senior_function/assigned/patient/diagnosis/list/";
  static String patientAppointmentdata = "/appointment/appointment/list/";
  static String addHumanTalk = "/accounts/available-doctors/";
  static String rejectedList = "/accounts/notapproved-users/";
  static String forgotPassword = "/forgott_password/forgot/password/";
  static String checkOtpForgot = "/forgott_password/verify/otp/";
  static String resetPassword = "/forgott_password/new/password/";
}