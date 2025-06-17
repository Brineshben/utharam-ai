import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Service/Api_Service.dart';
import '../Model/DoctorParticularPatientMedicineModel.dart';

class DoctorParticularPatientMedicineController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<DoctorParticularPatientmedicineModel?> DoctorParticularPatientMedicineData = Rx(null);

  RxList<Data?> DoctorParticularPatientMedicineList = RxList();

  Future<void> DoctorParticularPatientMedicineDataz(String token,int userid) async {
    print("-----benebebn");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.ParticularDoctorMedicineList(token: token, userId: userid);
      print("-----onsultDoctorList-----$resp");
      if (resp['status'] == 'ok') {
        DoctorParticularPatientMedicineData.value = DoctorParticularPatientmedicineModel.fromJson(resp);
        DoctorParticularPatientMedicineList.value = DoctorParticularPatientMedicineData.value?.data ?? [];
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
