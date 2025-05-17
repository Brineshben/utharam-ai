import 'package:flutter/material.dart';

import '../Model/Login_Model.dart';
import '../Roles_UI/UI/Common_Widget/popups.dart';
import '../Service/Api_Service.dart';
import 'package:get/get.dart';

import '../Service/SharedPreference.dart';

class UserAuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<LoginModel?> loginData = Rx(null);
  Rx<Data?> userdata = Rx(null);

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchUserData(
      {required String username, required String password}) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp =
      await ApiServices.userLogin(userName: username, psw: password);
      print("------resp------$resp");
      if (resp['status'] == "ok") {
        LoginModel loginApi = LoginModel.fromJson(resp);
        loginData.value = loginApi;
        await SharedPrefs().setLoginData(loginApi);

        // print("------loginApi------${loginData.value?.data?.role}");
        isLoaded.value = true;

      } else {
        ProductAppPopUps.submit(
          title: "Failed",
          message: resp['message'] ?? 'Something went wrong.',
          actionName: "Close",
          iconData: Icons.error_outline,
          iconColor: Colors.red,
        );
      }
    } catch (e){
      ProductAppPopUps.submit(
        title: "Failed",
        message:'Something went wrong.',
        actionName: "Close",
        iconData: Icons.error_outline,
        iconColor: Colors.red,
      );
  }

  }

  Future<void> getUserLoginSaved(LoginModel loginApi) async {
    loginData.value = loginApi;
    isLoaded.value = true;
  }
}
