// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../AppintmentsPage/Appointments.dart';
// import '../home_screen.dart';
//
// class PageIndexNavigation extends StatefulWidget {
//   const PageIndexNavigation({Key? key}) : super(key: key);
//
//   @override
//   State<PageIndexNavigation> createState() =>
//       _PageIndexNavigationState();
// }
//
// class _PageIndexNavigationState extends State<PageIndexNavigation> {
//   int _selectedIndex = 0;
//   final List<Widget> _screens = [
//     HomeScreen(),
//     AppointmentsScreen(),
//     HomeScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Colors.white ,
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: Padding(
//
//         padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//
//         child: Container(
//
//             height: 70.w,
//             child: BottomNavigationBar(
//               unselectedItemColor: Colors.grey,
//
//
//               backgroundColor: Colors.blue,
//
//               type: BottomNavigationBarType.fixed,
//               items: <BottomNavigationBarItem>[
//
//                 BottomNavigationBarItem(
//
//
//                   icon: SvgPicture.asset(
//                     'assets/images/Selectedhome.svg',
//                     height: 25,
//                     width: 25,
//
//                   ),
//                   label: 'HOME',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     'assets/images/Selectedwishlist.svg',
//                     height: 25,
//                     width: 25,
//
//                   ),
//                   label: 'APPOINTMENTS',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     'assets/images/SelectedProfile.svg',
//                     height: 25,
//                     width: 20,
//
//                   ),
//                   label: 'PROFILE',
//                 ),
//
//               ],
//               currentIndex: _selectedIndex,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//
//               selectedItemColor: Colors.white,  // Change the color for selected item
//             )// Call the function to update the index and navigate
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:patient/utils/color_util.dart';

import '../../../../Controller/AssignedDoctorPatients_Controller.dart';
import '../../../../Controller/Doctor_List_Controller.dart';
import '../../../../Controller/PatientAppointmentDetailsController.dart';
import '../../../../Controller/Quotes_Controller.dart';
import '../../../../Controller/ReportPatientController.dart';
import '../../../../Controller/SeniorDashboardController.dart';
import '../../../../Controller/SheduleController.dart';
import '../../../PATIENT/UI_PATIENT/Chat_Patient/Chat_PAtient.dart';
import '../../AppintmentsPage/Appointments.dart';

import '../../Assesment_therapist/Assesment_Page.dart';
import '../../DoctorListSenior/doctorListSenior.dart';
import '../../Reports/ReportsList.dart';
import '../../Shedule_Page/Upcoming_List.dart';
import '../../Shedule_Page/shedule.dart';
import '../home_screen.dart';

class PageIndexNavigationTherapist extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  final int doctorId;

  const PageIndexNavigationTherapist({
    Key? key,
    required this.role,
    required this.name,
    required this.token,
    required this.doctorId,
  }) : super(key: key);

  @override
  State<PageIndexNavigationTherapist> createState() =>
      _PageIndexNavigationTherapistState();
}

class _PageIndexNavigationTherapistState
    extends State<PageIndexNavigationTherapist> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    Get.find<ScheduleController>().scheduleDataz(widget.token);
    Get.find<AssignedDoctorToPatientController>()
        .assignedDoctorPatientData(widget.token, widget.doctorId);
    Get.find<SeniorDashboardController>().SeniorDashboardData(widget.token);
    Get.find<ReportPatientController>().reportListData(widget.token);
    Get.find<QuotesController>().QuotesData(widget.token);

    _screens = [
      HomeScreen(
        role: widget.role,
        name: widget.name,
        token: widget.token,
        doctorId: widget.doctorId,
      ),
      PatientExpandableCardList(
        token: widget.token, role: widget.role,
      ),
      AssesmentPage(
        token: widget.token,
      ),
      ReportsList(
        token: widget.token,
      ),
      DoctorListSenior(token:  widget.token, doctorId: widget.doctorId,)
      // ChatListPage()
    ];
  }
  void _handleTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Always call relevant API when a tab is selected
    switch (index) {
      case 0:
        Get.find<AssignedDoctorToPatientController>()
            .assignedDoctorPatientData(widget.token, widget.doctorId);
        break;
      case 1:
        Get.find<ScheduleController>().scheduleDataz(widget.token);
        break;
      case 2:
        Get.find<ScheduleController>().scheduleDataz(widget.token);
        break;
      case 3:
        Get.find<ReportPatientController>().reportListData(widget.token);
        break;  case 4:
      Get.find<DoctorListController>().doctorListData(widget.token);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 67.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 1,
                color: Colors.grey.shade200, // or any color you'd like
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child:  BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colorutils.userdetailcolor,
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                // onTap: (index) {
                //   setState(() {
                //     _selectedIndex = index;
                //   });
                // },
                onTap: _handleTabTap,

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
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/time-check.svg",
                      width: 25.w,
                      height: 25.h,
                      color: Colors.grey,
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 1
                            ? Colorutils.userdetailcolor
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Schedule',
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
                    label: 'Assessment',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/chat_outline.svg",
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
                    label: 'Reports',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/stethoscope.svg",
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
                    label: 'DoctorList',
                  ),
                ],
              ),
            ),

          ],
        )


















      ),
    );
  }
}
// BottomNavigationBar(
// unselectedItemColor: Colors.blueGrey,
// unselectedIconTheme: IconThemeData(color: Colors.blueGrey),
// // Unselected icon color
// iconSize: 5,
// elevation: 0,
//
//
// backgroundColor: Colorutils.userdetailcolor,
//
// type: BottomNavigationBarType.fixed,
// items: <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/Selectedhome.svg',
//
// height: 20,
// width: 20,
// ),
// label: 'HOME',
//
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/Selectedwishlist.svg',
// height: 20,
// width: 20,
// ),
// label: 'APPOINTMENTS',
// ),
// BottomNavigationBarItem(
// icon: SvgPicture.asset(
// 'assets/images/SelectedProfile.svg',
// height: 20,
// width: 20,
// ),
// label: 'PROFILE',
// ),
// ],
// currentIndex: _selectedIndex,
// onTap: (index) {
// setState(() {
// _selectedIndex = index;
// });
// },
// //
// selectedItemColor:
// Colors.white, // Change the color for selected item
// )
