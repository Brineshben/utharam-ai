import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/SheduleController.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import 'Add_Assesment.dart';
import 'Assesment_List.dart';

class AssesmentPage extends StatefulWidget {
  final String token;

  const AssesmentPage({super.key, required this.token});

  @override
  State<AssesmentPage> createState() => _AssesmentPageState();
}

class _AssesmentPageState extends State<AssesmentPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ScheduleController>().scheduleDataz(widget.token);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "PATIENT LIST",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // Doctor List View
            Expanded(
              child: GetX<ScheduleController>(
                builder: (ScheduleController controller) {
                  if (controller.scheduleList.isEmpty) {
                    return Padding(
                        padding:
                        const EdgeInsets.only(top: 40),
                        child: Center(
                          child: const Text(
                            "Oops...No Data Found.",
                            style: TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic),
                          ),
                        ));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.scheduleList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.scheduleList[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                Colors.white,
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/profileimage.jpg",
                                    fit: BoxFit.cover,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              title: Text(
                                patient?.patientName ?? "No Name",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    patient?.patientId ?? "No Name",
                                    style: TextStyle(
                                      fontSize: 14.h,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(

                                    children: [

                                      // GestureDetector(child: _buildTag("ADD", Colorutils.userdetailcolor),onTap: (){
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //     return AddAssesment(name: patient?.patientName ??"", patientId: patient?.patientId ??"", sevirity:patient?.aiSummary ??"", id: patient?.patient ??0, token: widget.token,);
                                      //   },));
                                      // },),  const SizedBox(width: 6),
                                      GestureDetector(child: _buildTag("VIEW", Colors.red),onTap: (){


                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return  AssesmentListPage(token: widget.token, name:patient?.patientName ??"", patientId: patient?.patientId ??"", id: patient?.patient ??0, sevirity:  patient?.aiSummary?.patientReport?.patientSummary ??"",);
                                        },));
                                      },),
                                    ],
                                  ),

                                ],
                              ),
                              onTap: () {
                                // Handle navigation or action
                              },
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                          ],
                        );
                      },
                    );


                  }
                },
              ),
            ),

          ],
        ),
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
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 9.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 12.h,
      ),
    ),
  );
}
