import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Service/Api_Service.dart';
import '../Model/ComplaintListModel.dart';

class ComplaintListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<ComplaintListModel?> ComplaintData = Rx(null);

  RxList<Data?> ComplaintList = RxList();

  Future<void> ComplaintListDataz(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp =
      await ApiServices.complaintList(token: token);
      if (resp['status'] == 'ok') {
        ComplaintData.value =
            ComplaintListModel.fromJson(resp);
        print("sfdtwqfdtwfd${ComplaintData.value?.data} ");
        ComplaintList.value =
            ComplaintData.value?.data ?? [];
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
