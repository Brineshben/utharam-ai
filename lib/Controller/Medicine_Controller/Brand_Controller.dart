import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/Medicine_model/BrandModel.dart';
import '../../Service/Api_Service.dart';



class BrandController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<BrandModel?> brandData = Rx(null);

  RxList<BrandData?> brandList = RxList();
  RxList<BrandData?> brandListCopy = RxList();

  Future<void> brandDataz(String token) async {
    print("---medicine");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.addBrand(token: token);
      print("---medicine resp-------$resp");
      if (resp['status'] == 'ok') {
        brandData.value = BrandModel.fromJson(resp);
        print("-medicine resp---${brandData.value?.data}");
        brandList.value = brandData.value?.data ?? [];
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
