import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/MultipleReportModel.dart';
import '../Service/Api_Service.dart';

class MultipleReportsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<MultipleReportsModel?> PatientDetailsData = Rx(null);
  RxList<PreliminaryDiagnoses?> PreliminaryDiagnosesData = <PreliminaryDiagnoses>[].obs;
  RxList<SecondaryDiagnoses?> SecondaryDiagnosesData = <SecondaryDiagnoses>[].obs;
  RxList<GeneralChats?> GeneralChatsData = <GeneralChats>[].obs;


  Future<void> patientDetailsReportData(String token, int id) async {
    print("----PatientDetails");

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.multipleReports(token: token, id: id);
      print("--PatientDetailsres--$resp");
      if (resp['status'] == 'ok') {
        PatientDetailsData.value = MultipleReportsModel.fromJson(resp);
        PreliminaryDiagnosesData.value = PatientDetailsData.value?.preliminaryDiagnoses ?? [];
        SecondaryDiagnosesData.value = PatientDetailsData.value?.secondaryDiagnoses ?? [];
        GeneralChatsData.value = PatientDetailsData.value?.generalChats ?? [];
        print("---PatientDetails--$resp");
        isLoading.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print("--PatientDetails---$e");

      isLoaded.value = false;

      ///popup
    } finally {
      isLoading.value = false;
    }
  }

}