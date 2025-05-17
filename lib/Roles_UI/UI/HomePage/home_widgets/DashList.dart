import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceData {
  final String name;
  final String data;
  final String designation;
  final String category;
  final IconData icon;

  AttendanceData({
    required this.name,
    required this.data,
    required this.icon,
    required this.designation,
    required this.category,
  });
}

class Attendancce extends StatefulWidget {
  final List<AttendanceData> attendanceList;

  const Attendancce({
    Key? key,
    required this.attendanceList,
  }) : super(key: key);

  @override
  State<Attendancce> createState() => _AttendancceState();
}

class _AttendancceState extends State<Attendancce> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.attendanceList.length, (index) {
            final data =
                widget.attendanceList[index]; // Get the data for the index
            return GestureDetector(
              onTap: () {
                // Perform any action on tap
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade50, Colors.blue.shade50], // Adjust colors to match your design
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // border: Border.all(
                  //   color: Colors.green, // Border color
                  //   width: 1, // Border width
                  // ),
                  borderRadius: BorderRadius.circular(25).r,
                ),
                margin:
                    const EdgeInsets.only(top: 3, bottom: 4, left: 6, right: 4),
                width: 180.w,
                height: 130.w,
                child: Padding(
                  padding: EdgeInsets.all(13).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        data.name,
                        style: TextStyle(fontSize: 35.h, color:Colors.green,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            size: 25.h,
                            data.icon,
                            color: Colors.green,
                          ),
                          Text(
                            data.category,
                            style:
                            TextStyle(fontSize: 15.h, color: Colors.green),
                          ),

                        ],
                      ),
                      // SizedBox(
                      //   height: 15,
                      //   child: Text(
                      //     data.data,
                      //     style: TextStyle(fontSize: 12.h, color: Colors.green),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
