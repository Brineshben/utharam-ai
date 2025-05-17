import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/color_util.dart';

class QuizSession {
  final String title;
  final String time;
  final String instructor;

  QuizSession({
    required this.title,
    required this.time,
    required this.instructor,
  });
}

class QuizList extends StatefulWidget {
  final List<QuizSession> sessions;

  const QuizList({Key? key, required this.sessions}) : super(key: key);

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.sessions.length, (index) {
          final session = widget.sessions[index];

          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25).r,
                border: Border.all(
                  color: Colorutils.userdetailcolor,
                  width: 0.3,
                ),
                gradient: LinearGradient(
                  colors: [Colors.teal.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              margin: const EdgeInsets.only(top: 15, bottom: 4, left: 10, right: 10),
              width: 180.w,
              height: 150.w,
              child: Padding(
                padding: const EdgeInsets.only(top: 1, left: 13, bottom: 13, right: 6).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        session.title,
                        style: GoogleFonts.nunito(
                          color: Colorutils.userdetailcolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.h,
                        ),
                      ),
                    ),

                    Text(
                      session.time,
                      style: GoogleFonts.nunito(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 15.h,
                      ),
                    ),
                    Text(
                      session.instructor,
                      style: GoogleFonts.nunito(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
