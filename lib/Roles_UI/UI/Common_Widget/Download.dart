import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadPdfToDownloads(String url) async {
  try {
    // Request storage permission

    // Create filename with timestamp
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'MetroMind_$timestamp.pdf';

    // Get the Downloads directory
    final downloadDir = Directory('/storage/emulated/0/Download');
    if (!await downloadDir.exists()) {
      print('Download directory does not exist');
      return;
    }

    // Download the file
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final file = File('${downloadDir.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
      print('Downloaded to: ${file.path}');
      Get.snackbar('Success', 'AI Report Downloaded Successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      print('Download failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Download error: $e');
  }
}