import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient/Model/Medicine_model/AddMedicineModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/Api_Constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();

  factory ApiServices() {
    return _instance;
  }

  ///patient Register PAge
  static Future<Map<String, dynamic>> patientRegister({
    required String name,
    required String userName,
    required String email,
    required String mobileNumber,
    required String password,
    required String confirmPassword,
    required String age,
    required String gender,
    required String occupation,
    required String address,
    required String education,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.registerPatient}";
    print("patient Register PAge$url");
    Map apiBody = {
      "name": name,
      "username": userName,
      "email": email,
      "mobile_number": mobileNumber,
      "password": password,
      "confirm_password": confirmPassword,
      "age": age,
      "gender": gender,
      "occupation": occupation,
      "education": education,

      // "medical_report": psw,
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = (json.encode(apiBody));
    request.headers.addAll({'Content-Type': 'application/json'});
    print('Api body---------------------->${request.body}');
    http.StreamedResponse response = await request.send();
    var respString = await response.stream.bytesToString();
    print('Api body---------------------->${json.decode(respString)}');
    return json.decode(respString);
  }

  ///Add Doctor
  static Future<Map<String, dynamic>> doctorRegister({
    required String token,
    required String name,
    required String userName,
    required String email,
    required String mobileNumber,
    required String password,
    required String role,
    required String age,
    required String gender,
    required String occupation,
    required String address,
    required String education,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addDoctor}";
    print("add doctor$url");
    Map apiBody = {
      "name": name,
      "username": userName,
      "email": email,
      "mobile_number": mobileNumber,
      "password": password,
      "role": role,
      "age": age,
      "gender": gender,
      "occupation": occupation,
      "education": education,
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = (json.encode(apiBody));
    request.headers.addAll(
      {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
    );
    print('Api body-----Add Doctor----------------->${request.body}');
    http.StreamedResponse response = await request.send();
    var respString = await response.stream.bytesToString();
    print(
        'Api body-----Add Doctorresponse----------------->${json.decode(respString)}');
    return json.decode(respString);
  }

  ///login
  static Future<Map<String, dynamic>> userLogin({
    required String userName,
    required String psw,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.login}";
    print(url);
    Map apiBody = {
      "email": userName,
      "password": psw,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});
      print('LOGIN API BODY------>${request.body}');
      http.StreamedResponse response = await request.send();
      print('LOGIN API BODY RESPONSE--------------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Patient Queue
  static Future<Map<String, dynamic>> patientQueue({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.patientQueue}";
    print("Patient Queue Response---$url");
    print("token---$token");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Patient Queue Response------->${response}');

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Appointment
  static Future<Map<String, dynamic>> addAppointment({
    required String token,
    required int doctor,
    required String date,
    required int patient,
    required int slot,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addAppointment}";
    print("Add Appointment---$url");
    Map apiBody = {
      "doctor": doctor,
      "patient": patient,
      "date": date,
      "slot": slot,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Patient Queue Response------->${request.body}');

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();
      print('Patient Queue Response------->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///DOCTOR LIST
  static Future<Map<String, dynamic>> doctorList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.doctorList}";
    print("Doctor List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Patient Queue Response------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }


  ///Patient LIST
  static Future<Map<String, dynamic>> patientList() async {
    String url = "${ApiConstants.baseURL}${ApiConstants.patientList}";
    print("patientList---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      // request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('patientList Response------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }


  ///Slot LIST
  static Future<Map<String, dynamic>> SlotList({
    required String token,
}) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.SlotList}";
    print("patientList---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('patientList Response------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }
  ///Consult DOCTOR LIST
  static Future<Map<String, dynamic>> consultDoctorList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.consultDoctorList}";
    print("consultDoctorList List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('consultDoctorList------>${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///Shedule List
  static Future<Map<String, dynamic>> SheduleList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.sheduleModel}";
    print("Shedule Listt---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Shedule List------>${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///patientDetails List
  static Future<Map<String, dynamic>> PatientDetails({
    required String token,
    required int id,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.patientDetails}$id/";
    print("Shedule Listt---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Shedule List------>${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///Assigned doctorPatients
  static Future<Map<String, dynamic>> AssignedDoctorPatientList({
    required String token,
    required int patientId,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.assignedDoctorAppointnmentList1}$patientId/";
    print("Assigned doctorPatientsList---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Assigned doctorPatientsList----->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Assigned doctorPatientsList");
    }
  }

  ///AddDoctorToPatient
  static Future<Map<String, dynamic>> addDoctorToPatient({
    required String token,
    required int patientId,
    required int doctorId,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.addDoctorToPatient}$patientId/";
    print(url);
    Map apiBody = {
      "doctor": doctorId,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      print('request.body------>${request.body}');

      http.StreamedResponse response = await request.send();
      print('response api-datat-------->${response.headers}');

      var respString = await response.stream.bytesToString();
      print('adddoctortopatient response api--------->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///addSecondAssesment
  static Future<Map<String, dynamic>> addSecondAssesment({
    required String token,
    required int userID,
    required String vaLUE,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addSecondAssesment}";
    print(url);
    Map apiBody = {
      "therapist_input": vaLUE,
      "user_id": userID,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('addSecondAssesment-->${response.headers}');
      var respString = await response.stream.bytesToString();
      print('addSecondAssesment response api--------->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///JuniorDashboardCount
  static Future<Map<String, dynamic>> juniorDashboard({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.juniorDashboard}";
    print("url------------------->$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      print('request.body------>${request.body}');
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print("respString------------------->$respString");

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///SeniorDashboardCount
  static Future<Map<String, dynamic>> seniorDashboard({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.seniorDashboard}";
    print("url------------------->$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      print('request.body------>${request.body}');
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print("respString------------------->$respString");

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Quotes
  static Future<Map<String, dynamic>> Quotes({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.quotes}";
    print(url);

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      print('request.body-quotes----->${request.body}');
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Patient Appointment List
  static Future<Map<String, dynamic>> patientAppointmentData({
    required String token,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.patientAppointmentdata}";
    print("qwejkdhqweic$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();
      print('patientAppointmentdata--->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///AddObservationt
  static Future<Map<String, dynamic>> addObservation({
    required String token,
    required String observation,
    required int patientId,
    required int diagnosis,
    required int doctorId,
    required int assignedId,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addObservation}";
    print('URL---->${url}');
    Map apiBody = {
      "doctor": doctorId,
      "patient": patientId,
      "observations": observation,
      "diagnosis": diagnosis,
      "assigned": assignedId,
    };
    try {
      print('apiBodyapiBodyapiBody---->${apiBody}');
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('apiBodyapiBodyapiBody---->${request.body}');

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add to talk to human list
  static Future<Map<String, dynamic>> addTalkToHumanList({
    required String token,
    required int doctorId,
    required bool status,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.assignedDoctorAppointnmentList}";
    print('URL---->${url}');
    Map apiBody = {
      "doctor_id": doctorId,
      "is_call_available": status,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      print('Api body---->$apiBody');
      request.body = (json.encode(apiBody));
      // request.headers.addAll({'Content-Type': 'application/json'});
      // request.headers.addAll({'Authorization': "Bearer $token"});

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add to talk to human new voxbay
  static Future<Map<String, dynamic>> voxBayTalk({
    required String destination,
    required String extension,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.voxBay}";
    print('URL-voxBayTalk--->${url}');
    Map apiBody = {
      "destination": destination,
      "extension": extension,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      print('Api body---->$apiBody');
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});
      // request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Enable chat
  static Future<Map<String, dynamic>> enableChat({
    required int patientId,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.enableChat}";
    print('URL---->${url}');
    Map apiBody = {
      "patient_id": patientId,
    };
    try {
      print('apiBodyapiBodyapiBody---->${apiBody}');
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }
  ///disable chat
  static Future<Map<String, dynamic>> disableChat({
    required int patientId,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.disableChat}";
    print('URL---->${url}');
    Map apiBody = {
      "patient_id": patientId,
    };
    try {
      print('apiBodyapiBodyapiBody---->${apiBody}');
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      print('respString---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot
  static Future<Map<String, dynamic>> addSlot({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addSlot}";
    print(url);

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Report Patient List
  static Future<Map<String, dynamic>> reportPatientList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.reportPatientList}";
    print("Request URL: $url");

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Multiple Reports
  static Future<Map<String, dynamic>> multipleReports(
      {required int id, required String token}) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.multipleReports}";
    print("Multiple Reports: $url");
    Map apiBody = {
      "patient_id": id,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      // request.headers.addAll({'Content-Type': 'application/json'});
      print("Authorization: ${request.body}");

      http.StreamedResponse response = await request.send();
      print("response: ${response}");
      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot to patient
  static Future<Map<String, dynamic>> addSlotPatient({
    required String token,
    required String doctorName,
    required String date,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.addPatient}?doctor_name=$doctorName&date=$date";
    print("Request URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot Medicine
  static Future<Map<String, dynamic>> addMedicine({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.medicineList}";
    print("Medicine URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot brand
  static Future<Map<String, dynamic>> addBrand({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.brand}";
    print("Medicine URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Slot frequency
  static Future<Map<String, dynamic>> addFrequency({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.frequency}";
    print("Medicine URL: $url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add send OTP
  static Future<Map<String, dynamic>> sendOTP(String phoneNumber) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.sendOtp}";
    print("sendOtp: $url");
    Map apiBody = {
      "mobile_number": phoneNumber,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add check OTP
  static Future<Map<String, dynamic>> checkOTP(
      String phoneNumber, String oTP) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.checkOtp}";
    print("sendOtp: $url");
    Map apiBody = {
      "mobile_number": phoneNumber,
      "otp": oTP,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      request.headers.addAll({'Content-Type': 'application/json'});

      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Send Medicine LIst
  static Future<Map<String, dynamic>> addMedicineList({
    required String token,
    required AddMedicineModel addData,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.sddMedicineList}";
    print("Medicine URL: $url");

    Map apiBody = addData.toJson();

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      request.body = (json.encode(apiBody));
      print("Medicine URL: ${request.body}");

      // request.headers.addAll(
      //   {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      // );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Particular Medicine LIST
  static Future<Map<String, dynamic>> ParticularMedicineList({
    required String token,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.particularMedicineList}";
    print("particularMedicineList List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('consultDoctorList------>${response}');

      var respString = await response.stream.bytesToString();
      print('consultDoctorList------>${json.decode(respString)}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error consultDoctorList");
    }
  }

  ///Patient AssesmentList Controller
  static Future<Map<String, dynamic>> patientAssesmentList({
    required String token,
    required int id,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.patientAssignmentList}$id/";
    print("patientAssignmentList List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('patientAssignmentList------>${response}');

      var respString = await response.stream.bytesToString();
      print('patientAsrespString--->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error patientAssignmentList");
    }
  }

  ///Patient diagnosisADD
  static Future<Map<String, dynamic>> diagnosisADD({
    required String token,
    required int id,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.diagnosisAdd}";
    print("diagnosisADD---$url");
    Map apiBody = {
      "diagnosis_id": id,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();
      print('diagnosisADD--->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error patientAssignmentList");
    }
  }

  ///Add assignmentCreate
  static Future<Map<String, dynamic>> assignmentCreate(
      {required int patientId,
      required String question,
      required String token}) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.createAssignment}";
    print("assignmentCreate: $url");
    Map apiBody = {
      "patient": patientId,
      "question_text": question,
    };

    try {
      print("Apibody: $apiBody");

      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Enter email Forgot password
  static Future<Map<String, dynamic>> forgotPasswordEmail({
    required String email,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.forgotPassword}";
    print("assignmentCreate: $url");
    Map apiBody = {
      "email": email,
    };

    try {
      print("Apibody: $apiBody");

      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///check OTP
  static Future<Map<String, dynamic>> checkOTp({
    required int id, required String otp,

  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.checkOtpForgot}$id/";
    print("assignmentCreate: $url");
    Map apiBody = {
      "otp_entered": otp,
    };

    try {
      print("Apibody: $apiBody");

      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }
  ///rESETpASSWORD
  static Future<Map<String, dynamic>> resetPassword({
    required int id,
    required String newPassword,
    required String confirm,

  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.resetPassword}$id/";
    print("assignmentCreate: $url");
    Map apiBody = {
      "new_password": newPassword,
      "confirm_password": confirm,
    };

    try {
      print("Apibody: $apiBody");

      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add assignmentCreate
  static Future<Map<String, dynamic>> Editassignment(
      {required int thoughtsID,
      required String response,
      required String token}) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.editAssignment}$thoughtsID/";
    print("assignmentedit: $url");
    Map apiBody = {
      "response_text": response,
    };

    try {
      print("assignmentedit: $apiBody");

      var request = http.Request('PATCH', Uri.parse(url));
      request.body = (json.encode(apiBody));

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );
      http.StreamedResponse response = await request.send();

      var respString = await response.stream.bytesToString();

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  /// Enquired LIST
  static Future<Map<String, dynamic>> enquiredList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.enquiredList}";
    print("Doctor List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({'Authorization': "Bearer $token"});
      http.StreamedResponse response = await request.send();
      print('Patient Queue Response------->${response}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Approve Enquiry LIST
  static Future<Map<String, dynamic>> approveEnquiredList({
    required String token,
    required int id,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.approveEnquiredList}$id/";
    print("Enquiry List---$url");

    try {
      var request = http.Request('POST', Uri.parse(url));

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Reject Enquiry LI
  static Future<Map<String, dynamic>> rejectEnquiredList({
    required String token,
    required int id,
  }) async {
    String url =
        "${ApiConstants.baseURL}${ApiConstants.rejectEnquiredList}$id/";
    print("Enquiry List---$url");

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Talk to human List
  static Future<Map<String, dynamic>> talkToHuman({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.talkToHuman}";
    print("Talk to human List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add Talk to human List
  static Future<Map<String, dynamic>> AddtalkToHuman({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addHumanTalk}";
    print("Talk to human List---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///REJECTED PATIENT LIST
  static Future<Map<String, dynamic>> rejectedList({
    required String token,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.rejectedList}";
    print("REJECTED PATIENT LIST---$url");

    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('REJECTED PATIENT LIST-->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Add addons
  static Future<Map<String, dynamic>> AddData({
    required String token,
    required String add_on_obs,
    required int doctor_id,
    required int patient_id,
    required int diagnosis_id,
  }) async {
    String url = "${ApiConstants.baseURL}${ApiConstants.addAddon}";
    print("Talk to human List---$url");
    Map apiBody = {
      "add_on_obs": add_on_obs,
      "doctor_id": doctor_id,
      "patient_id": patient_id,
      "diagnosis_id": diagnosis_id,
    };
    print("Talk to human List---$apiBody");

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      // request.headers.addAll({'Authorization': "Bearer $token"});

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  ///Talk to generate Report
  static Future<Map<String, dynamic>> generateReport({
    required String token,
    required int id,
  }) async {
    Map apiBody = {"user": id};
    String url = "${ApiConstants.baseURL}${ApiConstants.generateReport}";
    print("generate Report--$url");

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      // request.headers.addAll({'Authorization': "Bearer $token"});

      request.headers.addAll(
        {'Authorization': "Bearer $token", 'Content-Type': 'application/json'},
      );

      http.StreamedResponse response = await request.send();
      print('Enquiry---->${response.statusCode}');

      var respString = await response.stream.bytesToString();
      print('Enquiry---->${respString}');

      return json.decode(respString);
    } catch (e) {
      throw Exception("Service Error Login Api");
    }
  }

  static Future<dynamic> createSlot({
    required String token,
    required TimeOfDay? fromTime,
    required TimeOfDay? toTime,
    required String date,
    required int doctor,
  }) async {
    final url = Uri.parse(
      'https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net/booking/slots/create/',
    );

    // Helper to format TimeOfDay to "HH:mm:ss"
    String formatTimeOfDay(TimeOfDay tod) {
      final hour = tod.hour.toString().padLeft(2, '0');
      final minute = tod.minute.toString().padLeft(2, '0');
      return '$hour:$minute:00';
    }

    final body = {
      'from_time': formatTimeOfDay(fromTime!),
      'to_time': formatTimeOfDay(toTime!),
      'doctor': doctor,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
    };

    print('body: $body');
    //
    // final prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      print('response: ${response.body}');
      return jsonDecode(response.body);
    } catch (e) {
      Get.snackbar('Error', 'ToTime should be greater than FromTime ',
          snackPosition: SnackPosition.BOTTOM);
      // throw Exception('Failed to create slot: $e');
    }
  }

  // fetch slot list
  static Future<Map<String, dynamic>?> fetchSlots({
    required String date,
    required String token,
    required String doctorName,
  }) async {
    final url = Uri.parse(
        "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net/appointment/slots/filter/?date=$date&doctor_name=$doctorName");

    try {
      // final prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString('token');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print('API URL: $url');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json;
      }
    } catch (e) {
      print('Fetch error: $e');
      throw Exception('Failed to fetch slots: $e');
    }
    return null;
  }
}
