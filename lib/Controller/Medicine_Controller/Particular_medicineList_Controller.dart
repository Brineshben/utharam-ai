import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/Medicine_model/Particular_MedicineList_Model.dart';
import '../../Service/Api_Service.dart';

class ParticularMedicinelistController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<ParticularMedicineListModel?> particularMedicineListData = Rx(null);

  RxList<Data?> particularMedicineList = RxList();

  Future<void> particularMedicineListDataz(String token) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.ParticularMedicineList(token: token);
      print("-----onsultDoctorList-----$resp");
      if (resp['status'] == 'ok') {
        particularMedicineListData.value = ParticularMedicineListModel.fromJson(resp);
        particularMedicineList.value = particularMedicineListData.value?.data ?? [];
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
