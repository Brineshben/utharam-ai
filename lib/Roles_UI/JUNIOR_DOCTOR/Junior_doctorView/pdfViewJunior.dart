import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/GenerateReport_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/connectivity.dart';
import '../../UI/Common_Widget/popups.dart';

class FullScreenPdfViewerJunior extends StatefulWidget {
  final int patientid;
  final int diagnosisId;
  final int doctorID;
  final String token;

  const FullScreenPdfViewerJunior({
    super.key,
    required this.patientid,
    required this.token, required this.doctorID, required this.diagnosisId,
  });

  @override
  State<FullScreenPdfViewerJunior> createState() => _FullScreenPdfViewerJuniorState();
}

class _FullScreenPdfViewerJuniorState extends State<FullScreenPdfViewerJunior> {
  final TextEditingController textcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Get.find<GenerateReportController>().generateReportData(widget.token, widget.patientid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Top App Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            border: Border.all(color: Colors.blue, width: 0.1),
                            borderRadius: BorderRadius.circular(15).r,
                          ),
                          child: const Icon(Icons.arrow_back_ios_sharp, color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "AI Summary Report",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.h,
                        ),
                      ),
                    ],
                  ),
                ),

                // PDF Viewer
                Expanded(
                  child: GetX<GenerateReportController>(
                    builder: (controller) {
                      final filePath = controller.generateData.value?.fileUrl ?? "";
                      if (filePath.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return SfPdfViewer.network(filePath);
                    },
                  ),
                ),

                // Observation Section
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add Observation",
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, top: 5.h, right: 20.w, bottom: 10.h),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    controller: textcontroller,
                    validator: (val) =>
                    val!.trim().isEmpty ? 'Please Enter Observation.' : null,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black26),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      hintText: " Enter Observation   ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colorutils.userdetailcolor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colorutils.userdetailcolor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)).r,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    maxLines: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () async {
                      Get.find<EnquiredListController>().enquiryListData(widget.token);

                      checkInternet2(
                        context: context,
                        function: () async {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            context.loaderOverlay.show();

                            Map<String, dynamic> resp =
                            await ApiServices.AddData(

                                token: widget.token, add_on_obs: textcontroller.text, doctor_id: widget.doctorID, patient_id: widget.patientid, diagnosis_id:widget.diagnosisId );
                            context.loaderOverlay.hide();

                            if (resp['status'] == "ok") {
                              await ApiServices.diagnosisADD(id: widget.diagnosisId, token: widget.token);
                              await Get.find<EnquiredListController>().enquiryListData(widget.token);

                              ProductAppPopUps.submit2Back(
                                title: "Success",
                                message: resp['message'],
                                actionName: "Close",
                                iconData: Icons.done,
                                iconColor: Colors.green,
                              );
                            } else {
                              ProductAppPopUps.submit(
                                title: "Error",
                                message: resp['message'],
                                actionName: "Close",
                                iconData: Icons.error_outline_outlined,
                                iconColor: Colors.red,
                              );
                            }
                          }
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colorutils.userdetailcolor,
                        // gradient: LinearGradient(
                        //   colors: [
                        //     Colors.green.shade200,
                        //     Colors.blue.shade200
                        //   ], // Adjust colors to match your design
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      // width: 250.w,
                      height: 45.h,
                      child: Center(
                        child: Text(
                          'Approve Diagnosis',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
