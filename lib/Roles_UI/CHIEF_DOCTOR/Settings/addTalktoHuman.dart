import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controller/AddTalktoHumanController.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/popups.dart';
import 'Voxpayadd.dart';

class AddTalkToHuman extends StatefulWidget {
  final String token;
  AddTalkToHuman({super.key, required this.token});

  @override
  State<AddTalkToHuman> createState() => _AddTalkToHumanState();
}

class _AddTalkToHumanState extends State<AddTalkToHuman> {
  @override
  void initState() {
    Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);
    super.initState();
  }
  final AddTalkToHumanController controller = Get.put(AddTalkToHumanController());

  Future<void> makePhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      print("Launching: $uri");
      await launchUrl(uri, mode: LaunchMode.platformDefault);
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
                  "TALK TO HUMAN",
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
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.callHuman1List.isEmpty) {
                    return Center(
                      child: Text(
                        "No Data Found.",
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: controller.callHuman1List.length,
                      itemBuilder: (context, index) {
                        final callHuman = controller.callHuman1List[index];

                        return Column(
                          children: [
                            ListTile(
                              leading:  CircleAvatar(
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
                                callHuman?.name ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(callHuman?.role ?? ""),

                              trailing: GestureDetector(

                                  child: Icon(Icons.arrow_forward_ios, size: 20.w, color: Colors.blueGrey),onTap: (){
                                final extNo = (callHuman?.voxbayCalls?.isNotEmpty ?? false)
                                    ? callHuman?.voxbayCalls?.first.extNo
                                    : '0';     final empcode = (callHuman?.voxbayCalls?.isNotEmpty ?? false)
                                    ? callHuman?.voxbayCalls?.first.empCode
                                    : '0';
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return VoksBayAdd(phonenumber: callHuman?.mobileNumber ??"0" , empcode: empcode.toString(), extnumber: extNo.toString(), staff:  callHuman?.id ??0, token: widget.token,);
                                },));
                              },),






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
