import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Consult_Doctor_Model.dart';
import '../Service/Api_Service.dart';

class ConsultDoctorListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<ConsultDoctorModel?> consultDoctorData = Rx(null);

  RxList<Users?> consultDoctorList = RxList();
  RxList<Users?> consultDoctorListCopy = RxList();

  Future<void> ConsultdoctorListData(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.consultDoctorList(token: token);
      print("------consultDoctorList--------$resp");
      if (resp['status'] == 'ok') {
        consultDoctorData.value = ConsultDoctorModel.fromJson(resp);
        print("patient list${consultDoctorData.value?.users}");
        consultDoctorList.value = consultDoctorData.value?.users ?? [];
        consultDoctorListCopy.value = consultDoctorList.value;
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
  void SearchDoctorList( String data){
    consultDoctorList.value = consultDoctorListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
