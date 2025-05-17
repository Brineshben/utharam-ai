import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/JuniorDashboardModel.dart';
import '../Service/Api_Service.dart';

class JuniorDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<JuniorDashboardModel?> juniorDashboard = Rx(null);
  RxList<Data?> juniorList = RxList();

  Future<void> juniorData(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp =
          await ApiServices.juniorDashboard(token: token);
      print("----quotes---$resp");
      if (resp['status'] == 'ok') {
        juniorDashboard.value = JuniorDashboardModel.fromJson(resp);

        juniorList.value = juniorDashboard.value?.data ?? [];
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
