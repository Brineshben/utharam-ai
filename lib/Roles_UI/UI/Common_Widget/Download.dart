import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadPdfToDownloads(String url,String name) async {
  try {
    // Request storage permission

    // Create filename with timestamp
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'MetroMind-$name-$timestamp.pdf';

    // Get the Downloads directory
    final downloadDir = Directory('/storage/emulated/0/Download');
    if (!await downloadDir.exists()) {
      print('Download directory does not exist');
      return;
    }
    // Download the file
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final filePath = '${downloadDir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      print('Downloaded to: $filePath');

      Get.snackbar(
        'Success',
        'AI Report Downloaded Successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
        margin: const EdgeInsets.only(top: 15, left: 8,
            right: 8,bottom: 70),
        mainButton: TextButton(

          onPressed: () => OpenFilex.open(filePath),
          child: Text(
            'View',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    } else {
      print('Download failed with status: ${response.statusCode}');
    }

    // // Download the file
    // final response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200) {
    //   final file = File('${downloadDir.path}/$fileName');
    //   await file.writeAsBytes(response.bodyBytes);
    //   print('Downloaded to: ${file.path}');
    //   Get.snackbar(
    //     'Success',
    //     'AI Report Downloaded Successfully',
    //     snackPosition: SnackPosition.BOTTOM,
    //     duration: Duration(seconds: 5),
    //     mainButton: TextButton(
    //       onPressed: () => OpenFilex.open(filePath),
    //       child: Text(
    //         'View',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //
    //   );
    //   // Get.snackbar('Success', 'AI Report Downloaded Successfully',
    //   //     snackPosition: SnackPosition.BOTTOM);
    // } else {
    //   print('Download failed with status: ${response.statusCode}');
    // }
  } catch (e) {
    print('Download error: $e');
  }
}