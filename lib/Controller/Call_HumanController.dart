import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Call_HumanModel.dart';
import '../Service/Api_Service.dart';

class CallHumanController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<CallHumanModel?> callHumanData = Rx(null);

  RxList<Data?> callHumanList = RxList();

  Future<void> callHumanDataz(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.talkToHuman(token: token);
      print("----talkToHuman-----$resp");
      if (resp['status'] == 'ok') {
        callHumanData.value = CallHumanModel.fromJson(resp);
        print("patient list${callHumanData.value?.data}");
        callHumanList.value = callHumanData.value?.data ?? [];
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
