import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/Assignement_model/Patient_Assesment_ListModel.dart';
import '../../Service/Api_Service.dart';



class PatientAssignmentController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<patientAssesmentListModel?> patientAssesmentListData = Rx(null);

  RxList<Data?> patientAssesmentListDataList = RxList();

  Future<void> patientAssesmentListDataz(String token, int Id) async {
    print("---patientAssesmentListDataz");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.patientAssesmentList(token: token, id: Id);
      print("--patientAssesmentListDataz------$resp");
      if (resp['status'] == 'ok') {
        patientAssesmentListData.value = patientAssesmentListModel.fromJson(resp);
        patientAssesmentListDataList.value = patientAssesmentListData.value?.data ?? [];
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
