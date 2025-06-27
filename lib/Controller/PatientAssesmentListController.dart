import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/Doctor_List_Model.dart';
import '../Model/SheduleModel.dart';
import '../Service/Api_Service.dart';

class PatientAssesmentListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<SheduleModel?> scheduleData = Rx(null);

  RxList<Data?> scheduleList = RxList();
  RxList<Data?> scheduleListCopy = RxList();

  Future<void> scheduleDataz(String token) async {
    print("----scheduleDataz");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.SheduleList(token: token);
      print("---scheduleDataz resp-------$resp");
      if (resp['status'] == 'ok') {
        scheduleData.value = SheduleModel.fromJson(resp);
        print("-scheduleDataz resp----scheduleDataz resp---${scheduleData.value?.data}");

        // Assign raw list first
        List<Data?> rawList = scheduleData.value?.data ?? [];

        // Remove duplicates based on `id`
        final seenIds = <dynamic>{}; // you can use `int` or `String` depending on your model
        final filteredList = rawList.where((element) {
          if (element == null || seenIds.contains(element.patientId)) {
            return false;
          } else {
            seenIds.add(element.patientId);
            return true;
          }
        }).toList();

        scheduleList.value = filteredList;
        print("  scheduleList.value--${scheduleList.value.first?.patient}");
        scheduleListCopy.value = scheduleList.value;
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      isLoaded.value = false;
      // popup
    } finally {
      isLoading.value = false;
    }
  }

  void sehduleList( String data){
    scheduleList.value = scheduleListCopy.value.where((element) => (element?.patientName.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
