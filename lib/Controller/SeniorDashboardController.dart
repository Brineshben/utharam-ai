import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/SeniorDashboardModel.dart';
import '../Service/Api_Service.dart';

class SeniorDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<SeniorDashboard?> seniorDashboard = Rx(null);
  RxList<Data?> seniorList = RxList();

  Future<void> SeniorDashboardData(String token) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp =
      await ApiServices.seniorDashboard(token: token);
      print("----quotes---$resp");
      if (resp['status'] == 'ok') {
        seniorDashboard.value = SeniorDashboard.fromJson(resp);

        seniorList.value = seniorDashboard.value?.data ?? [];
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
