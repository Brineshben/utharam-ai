import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/AddTalktoHuman_Model.dart';
import '../Service/Api_Service.dart';

class AddTalkToHumanController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<AddtalktohumanModel?> callHuman1Data = Rx(null);

  RxList<Data?> callHuman1List = RxList();

  Future<void> callHuman1Dataz(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.AddtalkToHuman(token: token);
      print("----talkToHuman-----$resp");
      if (resp['status'] == 'ok') {
        callHuman1Data.value = AddtalktohumanModel.fromJson(resp);
        print("patient list${callHuman1Data.value?.data}");
        callHuman1List.value = callHuman1Data.value?.data ?? [];
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
  // void updateChatStatus(int index, bool value) {
  //   callHuman1List[index]?.chatEnabled = value;
  //   callHuman1List.refresh();
  // }
// void SearchDoctorList( String data){
//   doctorList.value = doctorListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();
//
// }
}
