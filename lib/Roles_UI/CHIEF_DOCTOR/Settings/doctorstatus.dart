import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/utils/color_util.dart';


import '../../../Controller/DoctorallListController.dart';
import '../../../Service/Api_Service.dart';
import '../../UI/Common_Widget/popups.dart';

class DoctorStatusList extends StatefulWidget {
  final String token;

  const DoctorStatusList({super.key, required this.token});

  @override
  State<DoctorStatusList> createState() => _DoctorStatusListState();
}

class _DoctorStatusListState extends State<DoctorStatusList> {
  @override
  void initState() {
    super.initState();
    Get.find<DoctorAllListController>().doctorallListData(widget.token);
  }

  void toggleSwitch(bool newValue, int doctorId) async {
    try {
      context.loaderOverlay.show();

      final response = await ApiServices.deActivateDoctor(
        token: widget.token,
        userId: doctorId,
      );

      context.loaderOverlay.hide();

      if (response['status'] == "ok") {
        // Refresh data
        Get.find<DoctorAllListController>().doctorallListData(widget.token);
        ProductAppPopUps.submit(
          title: "Success",
          message: response['message'],
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      } else {
        ProductAppPopUps.submit(
          title: "Failed",
          message: response['message'] ?? "Something went wrong",
          actionName: "Close",
          iconData: Icons.error,
          iconColor: Colors.red,
        );
      }
    } catch (e) {
      context.loaderOverlay.hide();
      ProductAppPopUps.submit(
        title: "Error",
        message: "Cannot deactivate user with existing appointments.",
        actionName: "Close",
        iconData: Icons.error,
        iconColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "DOCTOR STATUS",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 50.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                width: double.infinity,
                child: TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    Get.find<DoctorAllListController>().SearchDoctorList(value);
                  },
                  validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: "Search Doctors",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/images/MagnifyingGlass.svg",
                        color: Colorutils.userdetailcolor,
                      ),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colorutils.userdetailcolor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colorutils.userdetailcolor, width: 1.0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ),

            // Doctor List
            Expanded(
              child: GetX<DoctorAllListController>(
                builder: (controller) {

                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.doctorList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Doctor's Data Found.",
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    itemCount: controller.doctorList.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.doctorList[index];
                      final isActive = doctor?.status == true;

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/doctorlogo.png",
                              fit: BoxFit.cover,
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ),
                        title: Text(
                          "DR. ${doctor?.name?.toUpperCase() ?? "No Name"}",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          doctor?.role?.toString() ?? "No Role",
                          style: TextStyle(
                            fontSize: 14.h,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Switch(
                          value: isActive,
                          onChanged: (value) {
                            toggleSwitch(value, doctor?.id ?? 0);
                          },
                          inactiveTrackColor: Colors.grey.withOpacity(0.2),
                          activeColor: Colorutils.userdetailcolor,
                          inactiveThumbColor: Colors.grey,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
