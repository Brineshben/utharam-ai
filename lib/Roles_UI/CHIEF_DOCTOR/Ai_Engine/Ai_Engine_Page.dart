import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class SessionModel {
  final String title;
  final String Count;
  final String time;
  final bool emergency;

  SessionModel({
    required this.title,
    required this.Count,
    required this.time,
    required this.emergency,
  });
}

class AiEngine extends StatefulWidget {
  AiEngine({super.key, required this.sessions});

  final List<SessionModel> sessions;

  @override
  State<AiEngine> createState() => _AiEngineState();
}

class _AiEngineState extends State<AiEngine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AI ENGINE",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25).w,
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40.h,
                  crossAxisSpacing: 10.w,
                  itemCount: widget.sessions.length,
                  itemBuilder: (context, index) {
                    final session = widget.sessions[index];
                    return GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Container(
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
                        padding: const EdgeInsets.all(10).w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              session.title.toUpperCase(),
                              style: GoogleFonts.nunito(
                                color: Colorutils.userdetailcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.h,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "${session.time}",
                              style: GoogleFonts.nunito(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w900,
                                fontSize: 13.h,
                              ),
                            ),
                            SizedBox(height: 15,),

                            session.emergency
                                ? GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colorutils.userdetailcolor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "GENERATE",
                                    style: GoogleFonts.shanti(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15.h,
                                    ),
                                  ),
                                ),
                              ),
                            )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
