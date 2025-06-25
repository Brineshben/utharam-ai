import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrader/upgrader.dart';

import '../../../../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../../../../Controller/PatientAppointmentDetailsController.dart';
import '../../../../Controller/Quotes_Controller.dart';
import '../../../../Controller/patientDetails_Controller.dart';
import '../../../../utils/Constants.dart';
import '../../../../utils/color_util.dart';

import '../../../UI/AppintmentsPage/Appointments.dart';
import '../../../UI/Common_Widget/Appointment_card.dart';
import '../../../UI/Common_Widget/DateFormat.dart';
import '../../../UI/Common_Widget/appbar.dart';
import '../../../UI/Common_Widget/pdfview.dart';
import '../../../UI/DoctorListSenior/doctorListSenior.dart';
import '../../../UI/HomePage/home_widgets/DashList.dart';
import '../../../UI/HomePage/home_widgets/overallView.dart';
import '../../../UI/HomePage/home_widgets/quiz_List.dart';
import 'Activity.dart';

class HomeScreenPatient extends StatefulWidget {
  final String name;
  final String role;
  final String token;
  final String date;
  final String patientId;

  const HomeScreenPatient(
      {super.key,
      required this.name,
      required this.role,
      required this.token,
      required this.date,
      required this.patientId});

  @override
  State<HomeScreenPatient> createState() => _HomeScreenPatientState();
}

class _HomeScreenPatientState extends State<HomeScreenPatient> {
  List<QuizSession> sessions = [
    QuizSession(
        title: "Next Session",
        time: "Tomorrow 2pm - 6pm",
        instructor: "Dr. Sara ben"),
    QuizSession(
        title: "Medication",
        time: "Improving",
        instructor: "7 day trend :Positive"),
    QuizSession(
        title: "Progress Score",
        time: "65% Complete",
        instructor: "Treatment plan"),
  ];


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return UpgradeAlert(

      dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyleDark,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Colors.green, Colors.white], // Define your colors
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserDetails(
                    isWelcome: true,
                    bellicon: true,
                    notificationcount: true,
                    name: widget.name,
                    image: 'assets/images/profile2.jpg',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 25.h, bottom: 25.h, left: 15.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.role.toUpperCase()} DASHBOARD",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    final controller = Get.find<QuotesController>();
                    return ThoughtOfTheDayWidget(
                      text: controller.quotesData.value?.message?.quote ??
                          "Wherever the art of medicine is loved, there is also a love of humanity.",
                      svgPath: "assets/images/Group.svg",
                      onReadMore: () {
                        print("Read More Clicked!");
                      },
                      author:
                          "-${controller.quotesData.value?.message?.author ?? "Brinesh ben"}",
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Enquiry",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(

                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colorutils.userdetailcolor,
                          width: 0.3,
                        ),
                      ),
                      elevation: 2,
                      margin:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: GetX<PatientdetailsController>(
                          builder: (controller) {
                            final diagnosisList = controller
                                .PatientDetailsData.value?.user?.diagnosis;

                            final hasDiagnosis = diagnosisList?.isNotEmpty ?? false;
                            final firstDiagnosis =
                                hasDiagnosis ? diagnosisList!.last : null;

                            final urlReport = firstDiagnosis?.aiPatientSummaryFile ?? "";
                            final isApproved = firstDiagnosis?.isApproved ?? false;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTitle('NAME: ', widget.name),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildTitle('USER ID: ', widget.patientId),
                                    GestureDetector(
                                      onTap: () {
                                        if (urlReport.isNotEmpty) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FullScreenPdfViewer(
                                                    pdfUrl: urlReport,
                                                  ),
                                            ),
                                          );
                                        } else {
                                          Get.snackbar('Failed', 'No AI report available',
                                            snackPosition: SnackPosition.BOTTOM,
                                            margin: const EdgeInsets.only(
                                                bottom: 70,
                                                left: 8,
                                                right: 8),);

                                        }
                                      },
                                      child: _buildTag("View AI Report",
                                          Colorutils.userdetailcolor),
                                    ),
                                  ],
                                ),
                                _buildTitle('DATE: ', widget.date),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    const SizedBox(height: 10),
                                    _buildTag(
                                      hasDiagnosis
                                          ? (isApproved
                                              ? "Your enquiry has been approved by our therapist. Please make a call to proceed."
                                              :"Your enquiry is being reviewed by our therapist. Please wait.")
                                          : "NO DIAGNOSIS",
                                      hasDiagnosis
                                          ? (isApproved ? Colors.green : Colors.red)
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                  GetX<Patientappointmentdetailscontroller>(
                    builder: (Patientappointmentdetailscontroller controller) {
                      if (controller.patientAppointmentListList.isEmpty) {
                        return const SizedBox(); // Return an empty widget when no data
                      }

                      final lastAppointment = controller.patientAppointmentListList.last;
                      final name = lastAppointment?.doctorDetails?.name ?? 'No Name';
                      final date = lastAppointment?.slotDetails?.date ?? 'No Date';
                      final role = lastAppointment?.doctorDetails?.role?? 'No Role';
                      final fromDate = lastAppointment?.slotDetails?.fromTime ?? 'No From Time';
                      final toDate = lastAppointment?.slotDetails?.toTime ?? 'No To Time';

                      if (name == "No Name") {
                        return const SizedBox(); // Return nothing if no valid name
                      } else {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.h, bottom: 1.h, left: 15.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Appointment Details",
                                    style: GoogleFonts.shanti(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppointmentCard2(
                              name: name,
                              date: date,
                              role:formatString(role) ,
                              fromDate: fromDate,
                              toDate: toDate,
                            ),
                          ],
                        );
                      }
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, bottom: 1.h, left: 15.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Activity",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colorutils.userdetailcolor.withOpacity(0.1),
                        border: Border.all(
                          color: Colorutils.userdetailcolor,
                          width: 1.w,
                        ),
                      ),
                      width: double.infinity,
                      height: 250.h,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetX<PatientAssignmentController>(
                            builder: (PatientAssignmentController controller) {
                          if (controller
                              .patientAssesmentListDataList.isNotEmpty) {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .patientAssesmentListDataList.length,
                              itemBuilder: (context, index) {
                                final patient = controller
                                    .patientAssesmentListDataList[index];
                                return Column(
                                  children: [
                                    RecentActivityTile(
                                      title: patient?.questionText
                                              ?.toUpperCase() ??
                                          "No Recent Activity",
                                      subtitle: formatDate(
                                          patient?.createdAt ?? "  "),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.withOpacity(0.3),
                                      endIndent: 10.0,
                                      indent: 10.0,
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: const Text(
                                "No Recent Activity found",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic),
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}

Widget _buildTitle(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 12.h, color: Colors.blueGrey),
        children: [
          TextSpan(
            text: '$title ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.h),
          ),
          TextSpan(
              text: value.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.h)),
        ],
      ),
    ),
  );
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
        fontSize: 13.h,
      ),
    ),
  );
}
