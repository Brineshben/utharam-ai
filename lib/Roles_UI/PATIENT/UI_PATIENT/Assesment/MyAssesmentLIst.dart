import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../../../UI/Common_Widget/DateFormat.dart';
import 'Done_Assesment.dart';


class MyAssesmentListPage extends StatefulWidget {
  final String token;
  final int id;

  const MyAssesmentListPage({super.key, required this.token, required this.id});

  @override
  State<MyAssesmentListPage> createState() => _MyAssesmentListPageState();
}

class _MyAssesmentListPageState extends State<MyAssesmentListPage> {
  @override
  void initState() {
    super.initState();
    Get.find<PatientAssignmentController>().patientAssesmentListDataz(widget.token,widget.id);
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
                "Assessment List".toUpperCase(),
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
              child: GetX<PatientAssignmentController>(
                builder: (PatientAssignmentController controller) {
                  if (controller.patientAssesmentListDataList.isEmpty) {
                    return Padding(
                        padding:
                        const EdgeInsets.only(top: 40),
                        child: Center(
                          child: const Text(
                            "No Assessment Data Found",
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
                      itemCount: controller.patientAssesmentListDataList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.patientAssesmentListDataList[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green.withOpacity(0.1),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/profile2.jpg",
                                    fit: BoxFit.cover,
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                ),
                              ),
                              title: Column(

                                children: [
                                  Text(
                                    patient?.patient?.name ?? "No Name",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ), Text(
                                    "DOCTOR NAME :${patient?.doctor?.name ?? "No Name"}",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    formatDate( patient?.createdAt ?? "No Name"),
                                    style: TextStyle(
                                      fontSize: 14.h,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "QUESTION :",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        patient?.questionText ?? "No Name",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),

                                  patient?.responseText !=null?

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ANSWER :",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        patient?.responseText ?? "No Response",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ):SizedBox(),
                                  patient?.responseText ==null?
                                  Row(
                                    children: [

                                      GestureDetector(child: _buildTag("Add Response", Colors.blue),onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return DoneAssesment(name: patient?.patient?.name ?? "",
                                            patientId: patient?.patient?.patientId ?? "",
                                            questionText:patient?.questionText ?? "",
                                            token: widget.token,
                                            phone: patient?.patient?.mobileNumber ?? "0",
                                            thoughtID: patient?.id ?? 0, dataSubmited: patient?.responseText ?? "",);
                                        },));
                                      },),
                                    ],
                                  ):SizedBox(),
                                  // Row(
                                  //   children: [
                                  //
                                  //     GestureDetector(child: _buildTag("View", Colors.blue),onTap: (){
                                  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  //         return DoneAssesment(name: patient?.patient?.name ?? "",
                                  //           patientId: patient?.patient?.patientId ?? "",
                                  //           questionText:patient?.questionText ?? "",
                                  //           token: widget.token,
                                  //           phone: patient?.patient?.mobileNumber ?? "0",
                                  //           thoughtID: patient?.id ?? 0, dataSubmited: patient?.responseText ?? "",);
                                  //       },));
                                  //     },),
                                  //   ],
                                  // ),

                                ],
                              ),
                              // subtitle: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //
                              //   children: [
                              //     Text(
                              //       formatDate( patient?.createdAt ?? "No Name"),
                              //       style: TextStyle(
                              //         fontSize: 14.h,
                              //         color: Colors.blueGrey,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //     Row(
                              //       children: [
                              //
                              //         GestureDetector(child: _buildTag("View", Colors.blue),onTap: (){
                              //           Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //             return DoneAssesment(name: patient?.patient?.name ?? "",
                              //               patientId: patient?.patient?.patientId ?? "",
                              //               questionText:patient?.questionText ?? "",
                              //               token: widget.token,
                              //               phone: patient?.patient?.mobileNumber ?? "0",
                              //               thoughtID: patient?.id ?? 0, dataSubmited: patient?.responseText ?? "",);
                              //           },));
                              //         },),
                              //       ],
                              //     ),
                              //
                              //   ],
                              // ),
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
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15.h,
      ),
    ),
  );
}
