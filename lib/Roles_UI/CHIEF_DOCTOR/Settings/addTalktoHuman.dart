import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controller/AddTalktoHumanController.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/popups.dart';
import 'Voxpayadd.dart';

class AddTalkToHuman extends StatefulWidget {
  final String token;
  const AddTalkToHuman({super.key, required this.token});

  @override
  State<AddTalkToHuman> createState() => _AddTalkToHumanState();
}

class _AddTalkToHumanState extends State<AddTalkToHuman> {
  final AddTalkToHumanController controller = Get.find<AddTalkToHumanController>();

  @override
  void initState() {
    controller.callHuman1Dataz(widget.token);
    super.initState();
  }

  Future<void> makePhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ADD TALK TO HUMAN",
                  style: GoogleFonts.shanti(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.h,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetX<AddTalkToHumanController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator(color: Colorutils.userdetailcolor));
                  }

                  if (controller.callHuman1List.isEmpty) {
                    return Center(
                      child: Text("No Data Found.",
                        style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.callHuman1List.length,
                    itemBuilder: (context, index) {
                      final callHuman = controller.callHuman1List[index];
                      final isAvailable = callHuman?.isCallAvailable ?? false;

                      return Column(
                        children: [
                          ListTile(
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
                            title: Text("Dr. ${callHuman?.name ?? ""}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                            subtitle: Text(callHuman?.role ?? "",style: TextStyle(fontSize: 14),),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [(callHuman?.voxbayCalls?.isNotEmpty ?? false)?
                                Switch(
                                  value: isAvailable,
                                  onChanged: (value) async {
                                    context.loaderOverlay.show();

                                    final status = !isAvailable;
                                    final resp = await ApiServices.addTalkToHumanList(
                                      token: widget.token,
                                      doctorId: callHuman?.id ?? 0,
                                      status: status,
                                    );

                                    context.loaderOverlay.hide();

                                    if (resp['status'] == "ok") {
                                      controller.callHuman1Dataz(widget.token);

                                      ProductAppPopUps.submit(
                                        title: "Success",
                                        message: status
                                            ? "Talk to human activated"
                                            : "Talk to human deactivated",
                                        actionName: "Close",
                                        iconData: Icons.done,
                                        iconColor: Colors.green,
                                      );
                                    } else {
                                      ProductAppPopUps.submit(
                                        title: "Error",
                                        message: "Something went wrong",
                                        actionName: "Close",
                                        iconData: Icons.error_outline_outlined,
                                        iconColor: Colors.red,
                                      );
                                    }
                                  },
                                  activeColor: Colorutils.userdetailcolor.withOpacity(0.1),
                                  activeTrackColor: Colorutils.userdetailcolor,
                                  inactiveThumbColor: Colorutils.userdetailcolor.withOpacity(0.1),
                                  inactiveTrackColor: Colors.grey.shade400,
                                ):SizedBox(),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: () {
                                    final extNo = (callHuman?.voxbayCalls?.isNotEmpty ?? false)
                                        ? callHuman?.voxbayCalls?.first.extNo
                                        : '0';
                                    final empCode = (callHuman?.voxbayCalls?.isNotEmpty ?? false)
                                        ? callHuman?.voxbayCalls?.first.empCode
                                        : '0';

                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => VoksBayAdd(
                                        phonenumber: callHuman?.mobileNumber ?? "0",
                                        empcode: empCode.toString(),
                                        extnumber: extNo.toString(),
                                        staff: callHuman?.id ?? 0,
                                        token: widget.token,
                                      ),
                                    ));
                                  },
                                  child: Icon(Icons.arrow_forward_ios, size: 20.w, color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
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
