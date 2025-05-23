import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Roles_UI/UI/Common_Widget/pdfview.dart';

import '../../../utils/color_util.dart';
import 'DateFormat.dart';
import 'Download.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String patientId;

  final String age;
  final String email;
  final String phone;
  final String sevirity;

  const PatientCard({
    Key? key,
    required this.email,
    required this.age,
    required this.patientId,
    required this.name,
    required this.phone,
    required this.sevirity,
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
            _buildTitle('Name :', name),
            _buildTitle('Patient ID :', patientId),
            _buildTitle('Age :', age.toString()),
            // _buildTitle('Email :', email),
            // _buildTitle('Phone :', phone),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                          getSeverityLevel(sevirity).toUpperCase(),
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
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class AiReport extends StatelessWidget {
  final String summary;
  final String name;
  final String repoturl;
  final String details;

  const AiReport({
    Key? key,
    required this.summary,
    required this.details, required this.repoturl, required this.name,
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
            if(repoturl.isNotEmpty && repoturl!= "")
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: ()async {
                   await downloadPdfToDownloads(repoturl,name)  ;               },
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
                          pdfUrl:repoturl,
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
                        "VIEW PRELIMINARY REPORT",
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

class PatientCardAssignemnt extends StatelessWidget {
  final String name;
  final String patientId;


  final String phone;

  const PatientCardAssignemnt({
    Key? key,

    required this.patientId,
    required this.name,
    required this.phone,
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
            _buildTitle('Name :', name),
            _buildTitle('Patient ID :', patientId),
            _buildTitle('AI Summary :', phone),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Colors.red,
            //         ),
            //         padding:
            //         EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
            //         child: Padding(
            //           padding: const EdgeInsets.only(
            //               left: 10, right: 10, top: 3, bottom: 3),
            //           child: Text(
            //             sevirity.toUpperCase(),
            //             style: GoogleFonts.nunito(
            //               color: Colors.white,
            //               // Ensure ColorUtils is defined or use a custom color.
            //               fontWeight: FontWeight.w600,
            //               fontSize: 12
            //                   .h, // Ensure you're using flutter_screenutil to define font size responsively.
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
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
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
