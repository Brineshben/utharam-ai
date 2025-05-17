// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import '../Service/Api_Service.dart';
// import '../UI/Common_Widget/popups.dart';
//
// class RegisterPatient extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool isLoaded = false.obs;
//   RxBool isError = false.obs;
//   Rx<RegisterPatient?> updatedatass = Rx(null);
//
//
//   void resetStatus() {
//     isLoading.value = false;
//     isError.value = false;
//   }
//
//   Future<void> updateaddemployee(
//       {required String data, required String employeeID}) async {
//     isLoading.value = true;
//     isLoaded.value = false;
//     try {
//       Map<String, dynamic> resp = await ApiServices.patientRegister(
//           userId: data, employeeID: employeeID);
//       print("------resp------$resp");
//       if (resp['status'] == "ok") {
//         EmployeeaddListModel sessionData = EmployeeaddListModel.fromJson(resp);
//         updatedatass.value = sessionData;
//         isLoaded.value = true;
//       }
//
//       else {
//         isLoaded.value = false;
//         ProductAppPopUps.submit(
//           title: "Failed",
//           message: "Employee with this Employee ID Already Exists.",
//           actionName: "Close",
//           iconData: Icons.error_outline,
//           iconColor: Colors.red,
//         );
//       }
//     } catch (e) {
//       isLoaded.value = false;
//           ProductAppPopUps.submit(
//             title: "Failed",
//             message: "Employee with this Employee ID Already Exists.",
//             actionName: "Close",
//             iconData: Icons.error_outline,
//             iconColor: Colors.red,
//           );
//
//
//           print("--------session id not generated---------");
//     } finally {
//       print("--------session id not generated---------");
//       isLoading.value = false;
//       // resetStatus();
//     }
//   }
// }
