import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/MultipleReportController.dart';
import '../../../Model/AssignedDoctorPatient_model.dart';
import '../Common_Widget/Download.dart';
import '../Common_Widget/pdfview.dart';

class ReportsDetails extends StatefulWidget {
  final String token;

  final int id;

  const ReportsDetails({super.key, required this.token, required this.id});

  @override
  State<ReportsDetails> createState() => _ReportsDetailsState();
}

class _ReportsDetailsState extends State<ReportsDetails> {
  @override
  void initState() {
    Get.find<MultipleReportsController>()
        .patientDetailsReportData(widget.token, widget.id);

    super.initState();
  }

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
        child: GetX<MultipleReportsController>(
          builder: (MultipleReportsController controller) {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colorutils.userdetailcolor,
                ),
              );
            }

            final preliminarySummary =
                (controller.PreliminaryDiagnosesData.isNotEmpty)
                    ? controller.PreliminaryDiagnosesData.first?.aiReport
                        ?.patientReport?.patientSummary
                    : 'No diagnosis summary available';
            final preliminarySummaryUrl =
                (controller.PreliminaryDiagnosesData.isNotEmpty)
                    ? controller.PreliminaryDiagnosesData.first?.aiSummaryFile
                    : 'No Data';
            final SecondaryDiagnosesDataSummary =
                (controller.SecondaryDiagnosesData.isNotEmpty)
                    ? controller.SecondaryDiagnosesData.first?.aiReport
                        ?.patientReport?.patientSummary
                    : 'No diagnosis summary available';
            final SecondaryDiagnosesDataSummaryUrl =
                (controller.SecondaryDiagnosesData.isNotEmpty)
                    ? controller.SecondaryDiagnosesData.first?.aiSummaryFile
                    : 'No Data';
            final GeneralChatsDataSummary =
                (controller.GeneralChatsData.isNotEmpty)
                    ? controller.GeneralChatsData.first?.aiReport?.patientReport
                        ?.patientSummary
                    : 'No diagnosis summary available';
            final GeneralChatsDataSummaryUrl =
                (controller.GeneralChatsData.isNotEmpty)
                    ? controller.GeneralChatsData.first?.aiSummaryFile
                    : 'No Data';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Text(
                        "PATIENT REPORT LIST",
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
                  height: 20.h,
                ),
                // Doctor List View
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "preliminary Report",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
                        ),
                      ),
                    ],
                  ),
                ),

                AiReport(
                  summary:
                      preliminarySummary ?? "No diagnosis summary available",
                  details: "details",
                  repoturl: preliminarySummaryUrl ?? "",
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Secondary Report",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
                        ),
                      ),
                    ],
                  ),
                ),
                AiReport(
                  summary: SecondaryDiagnosesDataSummary ??
                      "No diagnosis summary available",
                  details: "details",
                  repoturl: SecondaryDiagnosesDataSummaryUrl ?? "",
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Third Report",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
                        ),
                      ),
                    ],
                  ),
                ),
                AiReport(
                  summary: GeneralChatsDataSummary ??
                      "No diagnosis summary available",
                  details: "details",
                  repoturl: GeneralChatsDataSummaryUrl ?? "",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AiReport extends StatelessWidget {
  final String summary;
  final String repoturl;
  final String details;

  const AiReport({
    Key? key,
    required this.summary,
    required this.details,
    required this.repoturl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SUMMARY : ",
                    style: GoogleFonts.inter(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildTitle('      ', summary),
            if (repoturl.isNotEmpty && repoturl != "")
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await downloadPdfToDownloads(repoturl);
                    },
                    icon: Icon(Icons.download),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenPdfViewer(
                            pdfUrl: repoturl,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colorutils.userdetailcolor,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        child: Text(
                          "VIEW FULL REPORT",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            // Ensure ColorUtils is defined or use a custom color.
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                                .h, // Ensure you're using flutter_screenutil to define font size responsively.
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 2,
                  // ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colorutils.userdetailcolor,
                  //     ),
                  //     padding:
                  //     EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(
                  //           left: 10, right: 10, top: 3, bottom: 3),
                  //       child: Text(
                  //         "APPROVE",
                  //         style: GoogleFonts.nunito(
                  //           color: Colors.white,
                  //           // Ensure ColorUtils is defined or use a custom color.
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 12
                  //               .h, // Ensure you're using flutter_screenutil to define font size responsively.
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: 14.h,
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
