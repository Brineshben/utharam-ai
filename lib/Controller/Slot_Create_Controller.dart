import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient/Service/Api_Service.dart';

class CreateSlotController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxList<String> availableSlots = <String>[].obs;
  RxBool isLoading = false.obs;

  // Create a slot
  Future<void> createSlot({
    required String token,
    required TimeOfDay? fromtime,
    required TimeOfDay? totime,
    required String date,
    required int doctorId,
    required String doctorName,
  }) async {
    try {
      print('dddddddddddddddddd');

      final response = await ApiServices.createSlot(
        fromTime: fromtime,
        toTime: totime,
        date: date,
        doctor: doctorId, token: token,
      );

      print('response slot create $response');

      if (response['status'] == 'ok') {
        Get.snackbar('SUCCESS', 'Slot created successfully',
            snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(
              bottom: 10,
              left: 8,
              right: 8),);


        fetchSlots(date: DateTime.parse(date), doctorName: doctorName, token: token);
      }
      else {

        Get.snackbar('FAILED', 'Please select the correct time range.',
            snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(
              bottom: 10,
              left: 8,
              right: 8),);
      }
    } catch (e) {
      Get.snackbar('Error', 'Please select the correct time range.',
          snackPosition: SnackPosition.BOTTOM,margin: const EdgeInsets.only(
            bottom: 10,
            left: 8,
            right: 8),);
    }
  }

  Future<void> fetchSlots({
    required String token,

    required DateTime date,
    required String doctorName,
  }) async {
    try {
      isLoading.value = true;
      availableSlots.clear();

      final formattedDate = DateFormat('yyyy-MM-dd').format(date);

      Map<String, dynamic>? data = await ApiServices.fetchSlots(
        date: formattedDate,
        doctorName: doctorName, token: token,
      );

      print('responce $data');

      if (data != null) {
        if (data['status'] == "ok") {
          for (var item in data['data']) {
            final from = item['from_time'];
            final to = item['to_time'];
            availableSlots.add('$from - $to');
          }
        }
      }
    } catch (e) {
      print("'Failed to fetch slots $e");
      Get.snackbar('Error', 'Failed to fetch slots: $e',
          snackPosition: SnackPosition.BOTTOM,margin: const EdgeInsets.only(
            bottom: 10,
            left: 8,
            right: 8),);
    } finally {
      isLoading.value = false;
    }
  }
}