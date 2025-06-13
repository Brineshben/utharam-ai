import 'package:get/get.dart';
import '../Model/SlotModel.dart';
import '../Service/Api_Service.dart';

class SlotListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<SlotModel?> SlotData = Rx(null);

  RxList<Data?> SlotList = RxList();
  RxList<Data?> SlotListCopy = RxList();

  Future<void> SlotDataz(token) async {

    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp = await ApiServices.SlotList(token: token);
      print("----SlotDatazresp-----$resp");
      if (resp['status'] == 'ok') {
        print("----SlotDatazresp22-----$resp");

        SlotData.value = SlotModel.fromJson(resp);
        print("SlotDatazfgrg${SlotData.value?.data}");
        SlotList.value = SlotData.value?.data ?? [];
        SlotListCopy.value = SlotList.value;
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
  void SearchslotList( String data){
    SlotList.value = SlotListCopy.value.where((element) => (element?.patientDetails?.name.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();

  }
}
