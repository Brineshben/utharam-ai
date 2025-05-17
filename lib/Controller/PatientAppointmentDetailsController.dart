import 'package:get/get.dart';

import '../Model/PatientAppointmentDetails.dart';
import '../Service/Api_Service.dart';

class Patientappointmentdetailscontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<PatientAppointmentList?> patientAppointmentListData = Rx(null);

  RxList<Data?> patientAppointmentListList = RxList();

  Future<void> patientAppointmentListDataz(String token) async {
    print("---sachuuuuu--");

    isLoading.value = true;
    isLoaded.value = false;
    // try {
    Map<String, dynamic> resp = await ApiServices.patientAppointmentData(token: token);
    print("---patientAppointmentData--$resp");
    if (resp['status'] == 'ok') {
      patientAppointmentListData.value = PatientAppointmentList.fromJson(resp);
      patientAppointmentListList.value = patientAppointmentListData.value?.data ?? [];

      isLoading.value = true;
    } else {
      isError.value = true;
    }
    // } catch (e) {
    //   isLoaded.value = false;
    //
    //   ///popup
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
