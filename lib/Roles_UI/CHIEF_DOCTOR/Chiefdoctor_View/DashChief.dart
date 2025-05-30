import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../Controller/JuniorDashoard_Controller.dart';
import '../../../Controller/Patient_queue_Controller.dart';
import '../../../utils/color_util.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/EnquiryList_Page.dart';
import 'package:shimmer/shimmer.dart';

class Dashchief extends StatefulWidget {
  final int DoctorID;
  final String token;
  final bool emergency;

  const Dashchief({super.key, required this.token, required this.emergency, required this.DoctorID});

  @override
  State<Dashchief> createState() => _DashchiefState();
}

class _DashchiefState extends State<Dashchief> {


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JuniorDashboardController>();

    return Obx(() {
      if (controller.juniorList.isEmpty) {
        // Show shimmer while data is loading
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10).w,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 1.2,
          ),
          itemCount: 4, // Show fixed count of shimmer items
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade50,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25).r,
                ),
                padding: const EdgeInsets.all(10).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 15.h, width: 80.w, color: Colors.white),
                    Container(height: 30.h, width: 60.w, color: Colors.white),
                    Container(height: 20.h, width: double.infinity, color: Colors.white),
                  ],
                ),
              ),
            );
          },
        );
      }

      // Show actual data when loaded
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10).w,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 1.2,
        ),
        itemCount: controller.juniorList.length,
        itemBuilder: (context, index) {
          // Original itemBuilder content
          final item = controller.juniorList[index];
          return GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25).r,
                border: Border.all(
                  color: Colorutils.userdetailcolor,
                  width: 0.3,
                ),
                gradient: LinearGradient(
                  colors: [Colors.teal.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(10).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item?.key?.toUpperCase() ?? " ",
                    style: GoogleFonts.nunito(
                      color: Colorutils.userdetailcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.h,
                    ),
                  ),
                  SizedBox(height: 25.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        item?.value.toString() ?? "0",
                        style: GoogleFonts.nunito(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 25.h,
                        ),
                      ),
                      SizedBox(height: 10.w,),
                      if (item?.key == "Registered patients" && item?.value != 0)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                              Get.find<PatientQueueController>().patientData(widget.token);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'VIEW PATIENTS',
                                  style: GoogleFonts.shanti(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (item?.key == "Enquires" && item?.value != 0)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return EnquirylistPage(token: widget.token, doctorID: widget.DoctorID);
                              }));
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'VIEW ENQUIRIES',
                                  style: GoogleFonts.shanti(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      );
    });
  }

}
