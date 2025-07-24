import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/DoctorParticularPatientMedicineController.dart';
import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/Medicine_Controller/AddMedicineController.dart';
import '../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../Controller/ReportPatientController.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../Common_Widget/DateFormat.dart';
import '../Medicine/Medicine.dart';
import '../Medicine/Medicine_List_Widget.dart';

class Medicinelistsuggested extends StatefulWidget {
  final String token;
  final int id;

  const Medicinelistsuggested({super.key, required this.token, required this.id});

  @override
  State<Medicinelistsuggested> createState() => _MedicinelistsuggestedState();
}

class _MedicinelistsuggestedState extends State<Medicinelistsuggested> {
  TextEditingController controllers = TextEditingController();
  @override
  void initState() {
    super.initState();
    Get.find<DoctorParticularPatientMedicineController>().DoctorParticularPatientMedicineDataz(widget.token,widget.id);  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "MEDICINE LIST",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: GetX<DoctorParticularPatientMedicineController>(
                builder: (DoctorParticularPatientMedicineController controller) {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.DoctorParticularPatientMedicineList.isEmpty) {
                    return Padding(
                        padding:
                        const EdgeInsets.only(top: 20),
                        child: Center(
                          child: const Text(
                            "No Medicine Assigned Yet",
                            style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic),
                          ),
                        ));
                  } else {
                    return  SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.DoctorParticularPatientMedicineList[0]?.medicines?.length,
                        itemBuilder: (context, index) {
                          final medicine = controller.DoctorParticularPatientMedicineList;
                      
                          return Padding(
                            padding:
                            EdgeInsets.only(top: 1.h, left: 10.w, right: 8.w,),
                            child: MedicineCard3(
                              brandName: medicine.first?.medicines?[index].medicine ?? "--",
                              frequency: medicine.first?.medicines?[index].frequency ?? "--",
                              dosage:medicine.first?.medicines?[index].dosage ?? "--",
                              date: formatDate2(medicine.first?.date ?? "--"), token:widget.token, id: medicine.first?.medicines?[index].id ?? 0, patientId: widget.id,
                            ),
                          );
                      
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

            Get.find<MedicineController>().medicineDataz(widget.token);
            Get.find<FrequencyController>().frequencyDataz(widget.token);
            Get.find<AddMedicineController>().addMedicineData.value.clear();
            Get.find<AddMedicineController>().medicineControllers.clear();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Medicine(patientToken: widget.token, patientId: widget.id,);
              },
            ));

              },
        child: Icon(Icons.add,color: Colorutils.userdetailcolor,),
      ),
    );
  }
}
Widget _buildTag(String text, Color bgColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 13.h,
      ),
    ),
  );
}