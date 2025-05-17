import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Model/patient_Queue_Model.dart';

import '../Service/Api_Service.dart';

class PatientQueueController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<PatientQueueModel?> patientQueueData = Rx(null);

  RxList<Data?> patientList = RxList();

  Future<void> patientData(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    // try {
      Map<String, dynamic> resp = await ApiServices.patientQueue(token: token);
      print("----PatientQueueresponse---$resp");
      if (resp['status'] == 'ok') {
        patientQueueData.value = PatientQueueModel.fromJson(resp);
        patientList.value = patientQueueData.value?.data ?? [];
        // patientList.value.forEach((element) {
        //   if(element?.name == "vb") {
        //     print("--------data 1---------${element?.toJson()}");
        //     if(element?.diagnosis?.isNotEmpty ?? false) {
        //       element?.diagnosis?.forEach((data2) {
        //         print("--------data 2---------${data2.aiReport?.patientReport?.patientSummary}");
        //       },);
        //     }
        //   }
        // },);
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
