import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../Controller/AddTalktoHumanController.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/popups.dart';
import '../../UI/Register_Page/Register.dart';

class VoksBayAdd extends StatefulWidget {
  final String phonenumber;
  final String empcode;
  final String extnumber;
  final int staff;
  final String token;

  const VoksBayAdd({super.key, required this.phonenumber, required this.empcode, required this.extnumber, required this.staff, required this.token});

  @override
  State<VoksBayAdd> createState() => _VoksBayAddState();
}

class _VoksBayAddState extends State<VoksBayAdd> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phonenumber = TextEditingController();
  TextEditingController empcode = TextEditingController();
  TextEditingController extnumber = TextEditingController();
  TextEditingController staff = TextEditingController();


  @override
  void initState() {
    super.initState();

    phonenumber.text = widget.phonenumber;
    empcode.text = widget.empcode;
    extnumber.text = widget.extnumber;
    staff.text = widget.staff.toString(); // Convert int to String
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
        child: Form(
          key:_formKey ,
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
              buildTextField2(  "PhoneNumber", "assets/images/user.svg", false,
                  phonenumber, true, _formKey, false),
              buildTextField2("Employee Code", "assets/images/user.svg", false,
                  empcode, true, _formKey, false),
              buildTextField2("ExtensionNumber", "assets/images/user.svg", false, extnumber,
                  true, _formKey, false),

              buildTextField2("Staff Number", "assets/images/user.svg", false, staff,
                  true, _formKey, false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.white],
            // Adjust colors to match your design
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3),
              blurRadius: 0.1,
              spreadRadius: 0.1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  context.loaderOverlay.show();

                  Map<String, dynamic> resp = await ApiServices.addvoxbay(
                    didNo: phonenumber.text,
                    empCode: empcode.text,
                    extNo: extnumber.text,
                    staff: int.tryParse(staff.text) ?? 0,
                  );

                  if (resp['status'] == "ok") {
                    Get.find<AddTalkToHumanController>().callHuman1Dataz(widget.token);
                    context.loaderOverlay.hide();

                    ProductAppPopUps.submit22Back(
                      title: "Success",
                      message:resp['status'],
                      actionName: "Close",
                      iconData: Icons.done,
                      iconColor: Colors.green,
                    );
                  } else {
                    context.loaderOverlay.hide();

                    ProductAppPopUps.submit(
                      title: "Error",
                      message: resp['status'],
                      actionName: "Close",
                      iconData: Icons.error_outline_outlined,
                      iconColor: Colors.red,
                    );
                  }
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
              child: Container(
                width: 180.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Colorutils.userdetailcolor,
                    width: 0.8,
                  ),
                ),
                // width: 250.w,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ADD',
                        style: GoogleFonts.inter(
                          fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
