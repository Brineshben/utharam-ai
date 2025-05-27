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

class AddTalkToHuman extends StatefulWidget {
  final String token;
  AddTalkToHuman({super.key, required this.token});

  @override
  State<AddTalkToHuman> createState() => _AddTalkToHumanState();
}

class _AddTalkToHumanState extends State<AddTalkToHuman> {
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
                  if (controller.callHuman1List.isEmpty) {
                    return Center(
                      child: Text(
                        "Oops...No Data Found.",
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
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30.r,
                                child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/profile2.jpg",
                                      fit: BoxFit.cover,
                                      width: 54.r,
                                      height: 54.r,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                callHuman?.name ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(callHuman?.role ?? ""),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Switch(
                                    value: callHuman?.isCallAvailable ?? false,
                                    onChanged: (value) async{
                                      // setState(() async{
                                      //   if(callHuman?.isCallAvailable == true){
                                      //     print("beneferfgrefgr");
                                      //     context.loaderOverlay.show();
                                      //
                                      //     Map<String, dynamic> resp =
                                      //         await ApiServices.addTalkToHumanList(
                                      //         token: widget.token, doctorId: callHuman?.id  ?? 0 , status:false);
                                      //     context.loaderOverlay.hide();
                                      //
                                      //     if (resp['status'] == "ok") {
                                      //       Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);
                                      //
                                      //
                                      //       ProductAppPopUps.submit(
                                      //         title: "Success",
                                      //         message: "Talk to human deactivated",
                                      //         actionName: "Close",
                                      //         iconData: Icons.done,
                                      //         iconColor: Colors.green,
                                      //       );
                                      //     } else {
                                      //       ProductAppPopUps.submit(
                                      //         title: "Error",
                                      //         message:  "Something went wrong 1st",
                                      //         actionName: "Close",
                                      //         iconData: Icons.error_outline_outlined,
                                      //         iconColor: Colors.red,
                                      //       );
                                      //     }
                                      //   }else{
                                      //     Map<String, dynamic> resp =
                                      //         await ApiServices.addTalkToHumanList(
                                      //         token: widget.token, doctorId: callHuman?.id  ?? 0 , status:true);
                                      //     context.loaderOverlay.hide();
                                      //
                                      //     if (resp['status'] == "ok") {
                                      //
                                      //       Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);
                                      //
                                      //       ProductAppPopUps.submit(
                                      //         title: "Success",
                                      //         message: "Talk to human activated",
                                      //         actionName: "Close",
                                      //         iconData: Icons.done,
                                      //         iconColor: Colors.green,
                                      //       );
                                      //     } else {
                                      //       ProductAppPopUps.submit(
                                      //         title: "Error",
                                      //         message:  "Something went wrong 2nd",
                                      //         actionName: "Close",
                                      //         iconData: Icons.error_outline_outlined,
                                      //         iconColor: Colors.red,
                                      //       );
                                      //     }
                                      //
                                      //   }
                                      // });
                                      if(callHuman?.isCallAvailable == true){
                                        print("beneferfgrefgr");
                                        context.loaderOverlay.show();

                                        Map<String, dynamic> resp =
                                        await ApiServices.addTalkToHumanList(
                                            token: widget.token, doctorId: callHuman?.id  ?? 0 , status:false);
                                        context.loaderOverlay.hide();

                                        if (resp['status'] == "ok") {
                                          Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);


                                          ProductAppPopUps.submit(
                                            title: "Success",
                                            message: "Talk to human deactivated",
                                            actionName: "Close",
                                            iconData: Icons.done,
                                            iconColor: Colors.green,
                                          );
                                        } else {
                                          ProductAppPopUps.submit(
                                            title: "Error",
                                            message:  "Something went wrong 1st",
                                            actionName: "Close",
                                            iconData: Icons.error_outline_outlined,
                                            iconColor: Colors.red,
                                          );
                                        }
                                      }else{
                                        Map<String, dynamic> resp =
                                        await ApiServices.addTalkToHumanList(
                                            token: widget.token, doctorId: callHuman?.id  ?? 0 , status:true);
                                        context.loaderOverlay.hide();

                                        if (resp['status'] == "ok") {

                                          Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);

                                          ProductAppPopUps.submit(
                                            title: "Success",
                                            message: "Talk to human activated",
                                            actionName: "Close",
                                            iconData: Icons.done,
                                            iconColor: Colors.green,
                                          );
                                        } else {
                                          ProductAppPopUps.submit(
                                            title: "Error",
                                            message:  "Something went wrong 2nd",
                                            actionName: "Close",
                                            iconData: Icons.error_outline_outlined,
                                            iconColor: Colors.red,
                                          );
                                        }

                                      }
                                    },
                                    activeColor: Colorutils.userdetailcolor.withOpacity(0.1),
                                    activeTrackColor: Colorutils.userdetailcolor,
                                    inactiveThumbColor:  Colorutils.userdetailcolor.withOpacity(0.1),
                                    inactiveTrackColor: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                              onTap: () async{

                                                         },
                            ),
                            Divider(thickness: 0.3, indent: 10, endIndent: 10),
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
