import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../Controller/AssignedDoctorPatients_Controller.dart';
import '../../../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../../../Controller/PatientAppointmentDetailsController.dart';
import '../../../Controller/Quotes_Controller.dart';
import '../../../utils/Constants.dart';
import '../Common_Widget/appbar.dart';
import 'home_widgets/course_List.dart';
import 'home_widgets/overallView.dart';


class HomeScreen extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  final int doctorId;

  const HomeScreen(
      {super.key, required this.role, required this.name, required this.token, required this.doctorId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    Get.find<AssignedDoctorToPatientController>()
        .assignedDoctorPatientData(widget.token, widget.doctorId);
    Get.find<ParticularMedicinelistController>().particularMedicineListDataz(widget.token);
    Get.find<Patientappointmentdetailscontroller>().patientAppointmentListDataz(widget.token);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: PopScope(
        canPop: false,
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
                    name: '${widget.name} (${widget.role})',
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
                            fontSize: 18.h,
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
                      }, author: "-${controller.quotesData.value?.message?.author ?? "Brinesh ben"}",
                    );
                  }),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Patient List',
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
                    padding: const EdgeInsets.only(left: 10),
                    child: PatientsList(name: widget.name, role: widget.role, token:widget.token, doctorID:  widget.doctorId, ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Summary",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tickets(),
                ],
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ChatScreenDoctor()));
          //   },
          //   backgroundColor: Colors.white,
          //   child: SvgPicture.asset(
          //     'assets/images/chat_outline.svg', // Replace with your SVG path
          //     width: 30, // Adjust size as needed
          //     height: 30,
          //   ),
          // ),
        ),
      ),
    );
  }
}
