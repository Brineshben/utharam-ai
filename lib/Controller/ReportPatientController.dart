import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Doctor_List_Model.dart';
import '../Model/ReportPatientModel.dart';
import '../Service/Api_Service.dart';

class ReportPatientController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<ReportsPatientModel?> reportData = Rx(null);

  RxList<Data?> reportList = RxList();
  RxList<Data?> reportListCopy = RxList();

  Future<void> reportListData(String token) async {
    print("-----benebebnfdghegfhbr");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.reportPatientList(token: token);
      print("------doctorlist3--------$resp");
      if (resp['status'] == 'ok') {
        reportData.value = ReportsPatientModel.fromJson(resp);
        print("------doctorlisdvwefgvst3--------$resp");
        reportList.value = reportData.value?.data ?? [];
        reportListCopy.value = reportList.value;
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      isLoaded.value = false;
      print("------doctorlistdcwed3--------$e");

      ///popup
    } finally {
      isLoading.value = false;
    }
  }
  void searchReportPatientList( String data){
    reportList.value = reportListCopy.value.where((element) => (element?.patient?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}