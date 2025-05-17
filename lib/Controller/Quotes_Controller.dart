import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/QuotesModel.dart';
import '../Service/Api_Service.dart';

class QuotesController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<QuotesModel?> quotesData = Rx(null);


  Future<void> QuotesData(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.Quotes(token: token);
      print("----quotes---$resp");
      if (resp['status'] == 'ok') {
        quotesData.value = QuotesModel.fromJson(resp);
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