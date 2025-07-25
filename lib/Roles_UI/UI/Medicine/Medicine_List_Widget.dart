import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../Controller/DoctorParticularPatientMedicineController.dart';
import '../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../Common_Widget/popups.dart';
import '../SuggestMedicine/EditMedicine.dart';

class MedicineCard2 extends StatelessWidget {
  final String brandName;
  final String brand;
  final String token;
  final int id;
  final int patientId;
  final String frequency;
  final String dosage;
  final String date;

  const MedicineCard2({
    Key? key,
    required this.brandName,
    required this.frequency,
    required this.dosage,
    required this.date,
    required this.token,
    required this.id,
    required this.patientId, required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brandName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.branding_watermark, size: 15, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Brand: $brand',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.timeline_sharp, size: 15, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Frequency: $frequency',
                  style: TextStyle(fontSize: 12),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.delete, size: 20, color: Colors.red),
                  onTap: () async {
                    Map<String, dynamic> resp =
                        await ApiServices.deleteMedicine(token: token, id: id);
                    context.loaderOverlay.hide();
                    print("----------redvffegvsp---------?$resp");
                    if (resp['message'] ==
                        "Medicine deactivated successfully") {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OtpScreen(
                      //       phoneNumber: fullPhoneNumber,
                      //     ),
                      //   ),
                      // );
                      // ProductAppPopUps.submit2Back(
                      //   title: "Success",
                      //   message: resp['message'] ?? 'Something went wrong.',
                      //   actionName: "Close",
                      //   iconData: Icons.done,
                      //   iconColor: Colorutils.userdetailcolor,
                      // );
                      await Get.find<
                              DoctorParticularPatientMedicineController>()
                          .DoctorParticularPatientMedicineDataz(
                              token, patientId);
                    } else {
                      ProductAppPopUps.submit(
                        title: "Failed",
                        message: resp['message'] ?? 'Something went wrong.',
                        actionName: "Close",
                        iconData: Icons.error_outline,
                        iconColor: Colors.red,
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.medical_services, size: 15, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Dosage: $dosage',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time_rounded, size: 15, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Date: $date',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineCard3 extends StatelessWidget {
  final String medicineName;
  final String brandName;
  final String token;
  final int id;
  final int patientId;
  final int period;
  final int Quantity;
  final String frequency;
  final String Uom;
  final String Route;
  final String remarks;
  final String dosage;
  final String date;
  final String strength;

  const MedicineCard3({
    Key? key,
    required this.brandName,
    required this.frequency,
    required this.dosage,
    required this.date,
    required this.token,
    required this.id,
    required this.patientId, required this.medicineName, required this.period, required this.Quantity, required this.Uom, required this.Route, required this.remarks, required this.strength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medicineName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.timeline_sharp, size: 15, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Frequency: $frequency',
                  style: TextStyle(fontSize: 12),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.delete, size: 25.h, color: Colors.red),
                  onTap: () async {
                    Map<String, dynamic> resp =
                        await ApiServices.deleteMedicine(token: token, id: id);
                    context.loaderOverlay.hide();
                    print("----------redvffegvsp---------?$resp");
                    if (resp['message'] ==
                        "Medicine deactivated successfully") {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OtpScreen(
                      //       phoneNumber: fullPhoneNumber,
                      //     ),
                      //   ),
                      // );
                      // ProductAppPopUps.submit2Back(
                      //   title: "Success",
                      //   message: resp['message'] ?? 'Something went wrong.',
                      //   actionName: "Close",
                      //   iconData: Icons.done,
                      //   iconColor: Colorutils.userdetailcolor,
                      // );
                      await Get.find<
                              DoctorParticularPatientMedicineController>()
                          .DoctorParticularPatientMedicineDataz(
                              token, patientId);
                    } else {
                      ProductAppPopUps.submit(
                        title: "Failed",
                        message: resp['message'] ?? 'Something went wrong.',
                        actionName: "Close",
                        iconData: Icons.error_outline,
                        iconColor: Colors.red,
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: Icon(Icons.edit, size: 25.h, color: Colors.blue),
                  onTap: () async {
                    Get.find<MedicineController>().medicineDataz(token);
                    Get.find<FrequencyController>().frequencyDataz(token);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Editmedicine(
                            medicine: medicineName,
                            brand: brandName,
                            frequency: frequency,
                            Strength: strength,
                            dosage: dosage,
                            uom: Uom,
                            route:Route ,
                            remarks: remarks,
                            period: period,
                            quality: Quantity, token: token, id: id, patientId: patientId,
                          ),
                        ));
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.branding_watermark, size: 15, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Brand: $brandName',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.medical_services, size: 15, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Dosage: $dosage',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time_rounded, size: 15, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Date: $date',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String brandName;
  final String brand;
  final String frequency;
  final String dosage;
  final String date;

  const MedicineCard({
    Key? key,
    required this.brandName,
    required this.frequency,
    required this.dosage,
    required this.date, required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brandName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.branding_watermark, size: 15, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Brand: $brand',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.timeline_sharp, size: 15, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Frequency: $frequency',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.medical_services, size: 15, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Dosage: $dosage',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time_rounded, size: 15, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Date: $date',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
