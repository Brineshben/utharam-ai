import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../../../Controller/Call_HumanController.dart';
import '../../../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../../../Controller/PatientAppointmentDetailsController.dart';
import '../../../Controller/Quotes_Controller.dart';
import '../../../Controller/patientDetails_Controller.dart';
import '../../../utils/color_util.dart';
import '../../UI/ChatScreen/Chat.dart';
import '../../UI/Shedule_Page/shedule.dart';
import 'Assesment/Assesment.dart';
import 'Assesment/MyAssesmentLIst.dart';
import 'Chat_Patient/Chat_PAtient.dart';
import 'Home_Screen/Home_Screen_Patient.dart';
import 'Home_Screen/TalktoHuman.dart';
import 'Medicine/MedicineListJunior.dart';
import 'Secondchat.dart';
import 'SettingsPatient.dart';

class PageIndexNavigationPatient extends StatefulWidget {
  final String role;
  final int userid;
  final String name;
  final String date;
  final String patientId;
  final String tokenPatient;

  const PageIndexNavigationPatient(
      {Key? key,
      required this.tokenPatient,
      required this.role,
      required this.name,
      required this.date,
      required this.patientId,
      required this.userid})
      : super(key: key);

  @override
  State<PageIndexNavigationPatient> createState() =>
      _PageIndexNavigationPatientState();
}

class _PageIndexNavigationPatientState extends State<PageIndexNavigationPatient>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Get.find<QuotesController>().QuotesData(widget.tokenPatient);
    Get.find<CallHumanController>().callHumanDataz(widget.tokenPatient);
    Get.find<PatientdetailsController>()
        .PatientDetailsDataz(widget.tokenPatient, widget.userid);
    Get.find<ParticularMedicinelistController>()
        .particularMedicineListDataz(widget.tokenPatient);
    Get.find<Patientappointmentdetailscontroller>()
        .patientAppointmentListDataz(widget.tokenPatient);

    _screens = [
      HomeScreenPatient(
        name: widget.name,
        role: widget.role,
        token: widget.tokenPatient,
        date: widget.date,
        patientId: widget.patientId,
      ),
      TalkToHuman(),
      MyAssesmentListPage(token: widget.tokenPatient, id: widget.userid),
      Medicinelistjunior(token: widget.tokenPatient),
      ProfilePatientsSettingsPage(name: widget.name, role:widget.role, token:widget.tokenPatient,),

    ];
  }

  void _handleTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Always call relevant API when a tab is selected
    switch (index) {
      case 0:
        Get.find<QuotesController>().QuotesData(widget.tokenPatient);
        Get.find<Patientappointmentdetailscontroller>()
            .patientAppointmentListDataz(widget.tokenPatient);
        Get.find<PatientdetailsController>()
            .PatientDetailsDataz(widget.tokenPatient, widget.userid);
        break;
      case 1:
        Get.find<CallHumanController>().callHumanDataz(widget.tokenPatient);

        break;
      case 2:
        Get.find<PatientAssignmentController>().patientAssesmentListDataz(widget.tokenPatient,widget.userid);

        break;
      case 3:
        Get.find<ParticularMedicinelistController>()
            .particularMedicineListDataz(widget.tokenPatient);

        break;  case 4:
        Get.find<ParticularMedicinelistController>()
            .particularMedicineListDataz(widget.tokenPatient);

        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _selectedIndex,

          children: _screens,

        ),
        floatingActionButton: GetX<PatientdetailsController>(
          builder: (PatientdetailsController controller) {
            final bool chatEnabled =
                controller.PatientDetailsData.value?.user?.chatEnabled ?? false;

            if (chatEnabled) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen2(
                        role: widget.name,
                        name: widget.role,
                        date: widget.date,
                        patientId: widget.patientId,
                        tokenPatient: widget.tokenPatient,
                        userid: widget.userid,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Lottie.asset(
                      // "assets/images/Splash ScreenLQ.json",
                      "assets/images/AI Chat.json",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox(); // Return an empty widget if chat is not enabled
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colorutils.userdetailcolor,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _handleTabTap,

          // onTap: (index) {
          //   setState(() {
          //     _selectedIndex = index;
          //   });
          // },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/house-bottom.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(
            //     "",
            //     width: 25.w,
            //     height: 25.h,
            //     colorFilter: ColorFilter.mode(
            //       _selectedIndex == 1
            //           ? Colorutils.userdetailcolor
            //           : Colors.grey,
            //       BlendMode.srcIn,
            //     ),
            //   ),
            //   label: 'Metromind Ai',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/phone-call.svg",
                width: 25.w,
                height: 25.h,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Talk to Human',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/memo-pad.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Assessments',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/first-aid-kit.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Medicine',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/settings.svg",
                width: 25.w,
                height: 25.h,
                color: Colors.grey,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? Colorutils.userdetailcolor
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
