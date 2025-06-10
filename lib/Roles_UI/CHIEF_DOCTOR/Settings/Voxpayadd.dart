import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../UI/Register_Page/Register.dart';

class VoksBayAdd extends StatefulWidget {
  const VoksBayAdd({super.key});

  @override
  State<VoksBayAdd> createState() => _VoksBayAddState();
}

class _VoksBayAddState extends State<VoksBayAdd> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController data = TextEditingController();

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
              buildTextField2(  "Name", "assets/images/user.svg", false,
                  name, true, _formKey, false),
              buildTextField2("Name", "assets/images/user.svg", false,
                  name, true, _formKey, false),
              buildTextField2("Name", "assets/images/user.svg", false, name,
                  true, _formKey, false),
            ],
          ),
        ),
      ),
    );
  }
}
