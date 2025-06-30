import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/SlottoPatient_Model.dart';
import '../Service/Api_Service.dart';

class SlottopateientController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<SlottoDoctorModel?> slotToPatientDataz = Rx(null);

  RxList<Data?> slotToPatientList = RxList();

  // Future<void> slotToPatientData(String token,String doctorName,String date ) async {
  //   isLoading.value = true;
  //   isLoaded.value = false;
  //   slotToPatientDataz.value=null;
  //   slotToPatientList.value =[];
  //   try {
  //     Map<String, dynamic> resp = await ApiServices.addSlotPatient(token: token, doctorName: doctorName, date:date);
  //     print("--------------$resp");
  //     if (resp['status'] == 'ok') {
  //       slotToPatientDataz.value = SlottoDoctorModel.fromJson(resp);
  //       slotToPatientList.value = slotToPatientDataz.value?.data ?? [];
  //       print("------fvbdfb--------${slotToPatientList.value.length}");
  //       isLoading.value = true;
  //     } else {
  //       isError.value = true;
  //     }
  //   } catch (e) {
  //     isLoaded.value = false;
  //
  //     ///popup
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  Future<void> slotToPatientData(String token, String doctorName, String date) async {
    isLoading.value = true;
    isLoaded.value = false;
    slotToPatientDataz.value = null;
    slotToPatientList.value = [];

    try {
      Map<String, dynamic> resp = await ApiServices.addSlotPatient(
        token: token,
        doctorName: doctorName,
        date: date,
      );

      print("--------------$resp");

      if (resp['status'] == 'ok') {
        slotToPatientDataz.value = SlottoDoctorModel.fromJson(resp);

        // Filter slots based on end time
        final now = DateTime.now();
        final filteredList = slotToPatientDataz.value?.data?.where((slot) {
          try {
            final endTimeStr = slot.toTime ?? '';
            final fullEndTime = DateTime.parse('$date $endTimeStr');
            return fullEndTime.isAfter(now);
          } catch (e) {
            print("Error parsing endTime: $e");
            return false;
          }
        }).toList();

        slotToPatientList.value = filteredList ?? [];

        print("Filtered Slots Count: ${slotToPatientList.length}");
        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print("Error: $e");
      isLoaded.value = false;
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

}