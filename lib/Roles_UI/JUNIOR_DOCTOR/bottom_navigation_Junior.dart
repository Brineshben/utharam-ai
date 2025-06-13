import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient/Controller/Slot_Controller.dart';
import '../../Controller/AddTalktoHumanController.dart';
import '../../Controller/Doctor_List_Controller.dart';
import '../../Controller/JuniorDashoard_Controller.dart';
import '../../Controller/PatientListController.dart';
import '../../Controller/Patient_queue_Controller.dart';
import '../../Controller/Quotes_Controller.dart';
import '../../Controller/RejectedController.dart';
import '../../Controller/SheduleController.dart';
import '../../utils/color_util.dart';
import '../CHIEF_DOCTOR/Settings/settings.dart';
import '../UI/Assesment_therapist/Assesment_Page.dart';
import '../UI/Shedule_Page/Upcoming_List.dart';
import '../UI/Shedule_Page/shedule.dart';
import 'Junior_doctorView/Doctor_List.dart';
import 'Junior_doctorView/Home_Junior.dart';
import 'package:get/get.dart';

import 'appoinment/PatientListr.dart';

class PageIndexNavigationJunior extends StatefulWidget {
  final String role;
  final String name;
  final String token;
  final int doctorId;

  const PageIndexNavigationJunior({
    Key? key,
    required this.role,
    required this.name,
    required this.token, required this.doctorId,
  }) : super(key: key);

  @override
  State<PageIndexNavigationJunior> createState() =>
      _PageIndexNavigationJuniorState();
}

class _PageIndexNavigationJuniorState extends State<PageIndexNavigationJunior> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    Get.find<PatientQueueController>().patientData(widget.token);
    Get.find<SlotController>().SlotListData(widget.token);
    Get.find<DoctorListController>().doctorListData(widget.token);
    Get.find<ScheduleController>().scheduleDataz(widget.token);
    Get.find<QuotesController>().QuotesData(widget.token);
    Get.find<JuniorDashboardController>().juniorData(widget.token);
    Get.find<PatientListController>().PatientListData();

    _screens = [
      HomeScreenJunior(
        name: widget.name,
        role: widget.role,
        token: widget.token, doctorID: widget.doctorId,
      ),
      PatientExpandableCardList(token:widget.token, role: widget.role,),
      DoctorList(token: widget.token),
      AssesmentPage(
        token: widget.token,
      ),
      ProfileSettingsPage(name: widget.name, role:widget.role, token:widget.token,),

    ];
  }

  void _handleTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Always call relevant API when a tab is selected
    switch (index) {
      case 0:
        Get.find<JuniorDashboardController>().juniorData(widget.token);

        break;
      case 1:
        Get.find<ScheduleController>().scheduleDataz(widget.token);
        break;
      case 2:
        Get.find<DoctorListController>().doctorListData(widget.token);
        break;
        case 3:
        Get.find<PatientListController>().PatientListData();
        break;
        case 4:
          Get.find<RejectedController>().rejectedDataz(widget.token);
          Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);

          Get.find<PatientListController>().PatientListData();
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
      bottomNavigationBar: SizedBox(
        height: 67.h,
        child:  Stack(
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
              child: BottomNavigationBar(
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
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/patient.svg",
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
                    label: 'PatientList',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/stethoscope.svg",
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
                    label: 'DoctorList',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/memo-pad.svg",
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
                    label: 'Assessments',
                  ),   BottomNavigationBarItem(
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

          ],
        )






      ),
    );
  }
}
