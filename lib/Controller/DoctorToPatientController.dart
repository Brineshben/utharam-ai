import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/AddDoctortoPatient_Model.dart';
import '../Service/Api_Service.dart';

class DoctorToPatientController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<AddDoctortoPatientModel?> addDoctorToPatient = Rx(null);
  Rx<Doctor?> doctorDataz = Rx(null);

  Future<void> doctorToPatientData(
      final String token, final int doctorId, final int patientId) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.addDoctorToPatient(
          doctorId: doctorId, token: token, patientId: patientId);
      print("------AddDoctortoPatientModel--------$resp");
      if (resp['message'] == 'Doctor assigned successfully') {
        addDoctorToPatient.value = AddDoctortoPatientModel.fromJson(resp);
        print("------AddDoctortoPatientModelbenn--------${addDoctorToPatient.value}");

        doctorDataz.value = addDoctorToPatient.value?.data?.doctor;
        Get.snackbar(
          'Success', // Title
          'Doctor assigned successfully', // Message
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 3), // Auto dismiss time
          icon: Icon(Icons.check_circle, color: Colors.white),
        );

        isLoading.value = true;
      } else {
        Get.snackbar(
          'Success', // Title
          'Doctor assigned failed', // Message
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 3), // Auto dismiss time
          icon: Icon(Icons.check_circle, color: Colors.white),
        );
        isError.value = true;
      }
    } catch (e) {
      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }
}
