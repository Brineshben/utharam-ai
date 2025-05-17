import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Doctor_List_Model.dart';
import '../Service/Api_Service.dart';

class DoctorListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<DoctorListModel?> doctorData = Rx(null);

  RxList<Users?> doctorList = RxList();
  RxList<Users?> doctorListCopy = RxList();

  Future<void> doctorListData(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
    Map<String, dynamic> resp = await ApiServices.doctorList(token: token);
    print("------doctorlist3--------$resp");
    if (resp['status'] == 'ok') {
      doctorData.value = DoctorListModel.fromJson(resp);
      print("patient list${doctorData.value?.users}");
      doctorList.value = doctorData.value?.users ?? [];
      doctorListCopy.value = doctorList.value;
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
    doctorList.value = doctorListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
