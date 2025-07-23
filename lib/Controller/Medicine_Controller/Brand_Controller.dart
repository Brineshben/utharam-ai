import 'package:get/get.dart';
import '../../Model/Medicine_model/BrandModel.dart';
import '../../Service/Api_Service.dart';

class BrandController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<BrandModel?> brandData = Rx(null);

  RxList<Data?> brandList = RxList();
  RxList<Data?> brandListCopy = RxList();

  Future<void> brandDataz(String token, int id) async {
    print("--- brandDataz called for medicine id: $id ---");

    // 🔁 Reset before API call
    isLoading.value = true;
    isLoaded.value = false;
    isError.value = false;

    // ❌ Clear old data immediately to avoid flashing stale items
    brandList.clear();
    brandList.refresh();

    try {
      Map<String, dynamic> resp = await ApiServices.addBrand(token: token, id: id);
      print("-- brandDataz response: $resp");

      if (resp['status'] == 'ok') {
        brandData.value = BrandModel.fromJson(resp);
        brandList.value = brandData.value?.data ?? [];
        brandList.refresh(); // ✅ Force UI rebuild
        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (e) {
      print("-- brandDataz error: $e");
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}


// void sehduleList( String data){
//   scheduleList.value = scheduleListCopy.value.where((element) => (element?.patientName.toString().toLowerCase().contains(data.toLowerCase()) ?? false),).toList();
//
// }

