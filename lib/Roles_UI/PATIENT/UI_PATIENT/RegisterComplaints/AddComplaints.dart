import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../../../../Controller/ComplaintListController.dart';
import '../../../UI/Assesment_therapist/Add_Assesment.dart';
import '../../../UI/Common_Widget/DateFormat.dart';
import 'Add.dart';

class AddComplaint extends StatefulWidget {
  final String token;
  final String role;

  const AddComplaint({super.key, required this.token, required this.role});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  @override
  void initState() {
    super.initState();
    Get.find<ComplaintListController>().ComplaintListDataz(widget.token);

    // Get.find<ScheduleController>().scheduleDataz(widget.token);
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
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      border: Border.all(
                        color: Colors.blue,
                        width: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "COMPLAINT LIST",
                  style: GoogleFonts.shanti(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.h,
                  ),
                ),
              ],
            ),
            ),
            // Header Text

            SizedBox(
              height: 10.h,
            ),
            // Doctor List View
            Expanded(
              child: GetX<ComplaintListController>(
                builder: (ComplaintListController controller) {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.ComplaintList.isEmpty) {
                    return Center(
                      child: const Text(
                        "No Details Found",
                        style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.ComplaintList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.ComplaintList[index];
                        return Column(
                          children: [
                            ListTile(
                              leading:CircleAvatar(
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
                              title: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    patient?.userName ?? "No Name",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    formatDate( patient?.createdAt ?? "No Name"),
                              // patient?.createdAt ?? "",
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
                                        "COMPLAINT :",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        patient?.complaints ?? "No Name",
                                        style: TextStyle(
                                          fontSize: 14.h,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       "ANSWER :",
                                  //       style: TextStyle(
                                  //         fontSize: 14.h,
                                  //         color: Colors.green,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       patient?.responseText ?? "No Response",
                                  //       style: TextStyle(
                                  //         fontSize: 14.h,
                                  //         color: Colors.blueGrey,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
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
      floatingActionButton:widget.role!="admin"  ?FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddComplaints( token: widget.token,);
          },));        },
        child: Icon(Icons.add,color: Colorutils.userdetailcolor,),
      ):SizedBox(),
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
