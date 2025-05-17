import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/EnquiryModel.dart';
import '../Service/Api_Service.dart';

class EnquiredListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<Enquirylist?> enquiryData = Rx(null);

  RxList<Data?> enquiryList = RxList();
  RxList<Data?> enquiryListCopy = RxList();

  Future<void> enquiryListData(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.enquiredList(token: token);
      print("----Enquiry list-------$resp");
      if (resp['status'] == 'ok') {
        print("----Enquirydewgfwe list-------$resp");

        enquiryData.value = Enquirylist.fromJson(resp);
        print("--Enquiry listdata---${enquiryData.value?.data}");
        enquiryList.value = enquiryData.value?.data ?? [];
        enquiryListCopy.value = enquiryList.value;
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print('ereror in model$e');
      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }
  void SearchEnquiredList( String data){
    enquiryList.value = enquiryListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
