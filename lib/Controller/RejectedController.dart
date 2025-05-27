import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/RejectedModel.dart';
import '../Service/Api_Service.dart';

class RejectedController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<RejectedModel?> rejected1Data = Rx(null);
  RxList<Data?> rejected1List = RxList();

  Future<void> rejectedDataz(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.rejectedList(token: token);
      print("----rejected--$resp");
      if (resp['status'] == 'ok') {
        rejected1Data.value = RejectedModel.fromJson(resp);
        print("patient list${rejected1Data.value?.data}");
        rejected1List.value = rejected1Data.value?.data ?? [];
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

// void SearchDoctorList( String data){
//   doctorList.value = doctorListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();
//
// }
}
