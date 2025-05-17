import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/slot_Model.dart';
import '../Service/Api_Service.dart';

class SlotController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<SlotModel?> slotData = Rx(null);

  RxList<Data?> slotList = RxList();

  Future<void> SlotListData(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.addSlot(token: token);
      print("------doctorlist3--------$resp");
      if (resp['status'] == 'ok') {
        slotData.value = SlotModel.fromJson(resp);
       slotList.value = slotData.value?.data ?? [];
       print("------fvbdfb--------${slotList.value.length}");
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
