import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/PatientDetailsModel.dart';
import '../Service/Api_Service.dart';

class PatientdetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<PatientDetails?> PatientDetailsData = Rx(null);


  Future<void> PatientDetailsDataz(String token, int id) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.PatientDetails(token: token, id: id);
      print("----quotes---$resp");
      if (resp['status'] == 'ok') {
        PatientDetailsData.value = PatientDetails.fromJson(resp);
        print("----fywedtytyweftyew---$resp");
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print("----fywedtytyweftyew---$e");

      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }

}