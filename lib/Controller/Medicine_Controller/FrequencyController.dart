import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/Medicine_model/Frequency_Model.dart';
import '../../Service/Api_Service.dart';



class FrequencyController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<FrequencyModel?> frequencyData = Rx(null);

  RxList<FrequencyData?> frequencyList = RxList();
  RxList<FrequencyData?> frequencyListCopy = RxList();

  Future<void> frequencyDataz(String token) async {
    print("---medicine");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.addFrequency(token: token);
      print("---medicine resp-------$resp");
      if (resp['status'] == 'ok') {
        frequencyData.value = FrequencyModel.fromJson(resp);
        print("-medicine resp---${frequencyData.value?.data}");
        frequencyList.value = frequencyData.value?.data ?? [];
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
// void sehduleList( String data){
//   scheduleList.value = scheduleListCopy.value.where((element) => (element?.patientName.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();
//
// }
}
