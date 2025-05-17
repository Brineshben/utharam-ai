import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/generteReport_model.dart';
import '../Model/slot_Model.dart';
import '../Service/Api_Service.dart';

class GenerateReportController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<GenerateReportModel?> generateData = Rx(null);


  Future<void> generateReportData(String token,int id) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.generateReport(token: token, id: id);
      print("------doctorlist3--------$resp");
      if (resp['status'] == 'ok') {
        generateData.value = GenerateReportModel.fromJson(resp);
        isLoading.value = true;
      } else {
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