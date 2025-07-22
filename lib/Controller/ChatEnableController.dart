import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/ChatEnableModel.dart';
import '../Service/Api_Service.dart';

class Chatenablecontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<PatientchatListModel?> chatEnableData = Rx(null);

  RxList<Data?>chatEnableList = RxList();
  RxList<Data?> chatEnableListCopy = RxList();

  Future<void> chatEnableDataz(String token) async {
    print("----scheduleDataz");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.ChatEnable(token: token);
      print("--chatenableeeeDataz resp-------$resp");
      if (resp['status'] == 'success') {
        chatEnableData.value = PatientchatListModel.fromJson(resp);
        chatEnableList.value = chatEnableData.value?.data ?? [];
        chatEnableListCopy.value = chatEnableList.value;
        isLoading.value = true;
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

  void chatList( String data){
    chatEnableList.value = chatEnableListCopy.value.where((element) => (element?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
