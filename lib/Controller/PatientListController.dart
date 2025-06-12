import 'package:get/get.dart';

import '../Model/PatientListModel.dart';
import '../Service/Api_Service.dart';

class PatientListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<PatientListModel?> PatientData = Rx(null);

  RxList<Data?> PatientList = RxList();
  RxList<Data?> PatientListCopy = RxList();

  Future<void> PatientListData() async {

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.patientList();
      print("----PatientListresp-----$resp");
      if (resp['status'] == 'ok') {
        print("----PatientListresp22-----$resp");

        PatientData.value = PatientListModel.fromJson(resp);
        print("PatientListedfgrg${PatientData.value?.data}");
        PatientList.value = PatientData.value?.data ?? [];
        PatientListCopy.value = PatientList.value;
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print("bhscdhdgh$e");
      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }
  void SearchPatientList( String data){
    PatientList.value = PatientListCopy.value.where((element) => (element?.patient?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
