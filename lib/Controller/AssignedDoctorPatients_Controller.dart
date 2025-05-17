import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/AssignedDoctorPatient_model.dart';
import '../Service/Api_Service.dart';

class AssignedDoctorToPatientController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<AssignedDoctorPatientListModel?> assignedDoctorPatientDataz = Rx(null);

  RxList<Data?> assignedDoctorPatientList = RxList();
  RxList<PatientDiagnosis?> patientDiagnosisDetails = RxList();

  Future<void> assignedDoctorPatientData(String token, int patientId) async {
    isLoading.value = true;
    isLoaded.value = false;
    // try {
    Map<String, dynamic> resp = await ApiServices.AssignedDoctorPatientList(token: token, patientId:patientId);
    print("-------benben response----------$resp");
    if (resp['status'] == 'ok') {
      assignedDoctorPatientDataz.value = AssignedDoctorPatientListModel.fromJson(resp);
      print("p-benben response-${assignedDoctorPatientDataz.value?.data?.first.doctor}");
      assignedDoctorPatientList.value = assignedDoctorPatientDataz.value?.data ?? [];
      assignedDoctorPatientDataz.value?.data?.forEach((element) {
        if(element.patientDiagnosis?.isNotEmpty ?? false) {
          patientDiagnosisDetails.value.addAll(element.patientDiagnosis ?? []);
        }
      },);
      isLoading.value = true;
    } else {
      isError.value = true;
    }
    // } catch (e) {
    //   isLoaded.value = false;
    //
    //   ///popup
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
