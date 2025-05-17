import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/Medicine_model/Medicine_List_Model.dart';
import '../../Service/Api_Service.dart';



class MedicineController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<MedicineModel?> medicineData = Rx(null);

  RxList<MedicineData?> medicineList = RxList();
  RxList<MedicineData?> scheduleListCopy = RxList();

  Future<void> medicineDataz(String token) async {
    print("---medicine");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.addMedicine(token: token);
      print("---medicine resp-------$resp");
      if (resp['status'] == 'ok') {
        medicineData.value = MedicineModel.fromJson(resp);
        print("-medicine resp---${medicineData.value?.data}");
        medicineList.value = medicineData.value?.data ?? [];
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
