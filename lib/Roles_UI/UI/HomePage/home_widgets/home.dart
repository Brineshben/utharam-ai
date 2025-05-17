//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../utils/color_util.dart';
// import '../ChatScreen/Chat.dart';
// import '../Common_Widget/appbar.dart';
// import 'home_widgets/DashList.dart';
// import 'home_widgets/bottom_Navigationbar.dart';
// import 'home_widgets/course_List.dart';
// import 'home_widgets/patientList.dart';
// import 'home_widgets/quiz_List.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<AttendanceData> myAttendanceList = [
//     AttendanceData(name: "5", designation: "KAv", category: "Total Patients", icon: Icons.person, data: '+4 this Month'),
//     AttendanceData(name: "3", designation: "Prof", category: "Today Sessions", icon: Icons.calendar_month_outlined, data: 'Next:Brinesh (2pm)'),
//     AttendanceData(name: "10", designation: "Eng", category: "All Insights", icon: Icons.circle_outlined, data: 'Across 2 patients'),
//     AttendanceData(name: "5", designation: "Dr.", category: "Pending Reviews", icon: Icons.nature, data: 'Treatment plan needing review'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.95),
//
//       body: SizedBox(
//         width: ScreenUtil().screenWidth,
//         height: ScreenUtil().screenHeight,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const UserDetails(
//                 isWelcome: true,
//                 bellicon: true,
//                 notificationcount: true, name: '', image: '',
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Therapist Dashboard",
//                       style: GoogleFonts.shanti(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w900,
//                         fontSize: 20.h,
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Attendancce(attendanceList: myAttendanceList),
//               SizedBox(height: 20,),
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Patient List',
//                       style: GoogleFonts.shanti(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w900,
//                         fontSize: 20.h,
//                       ),                    ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         '4 Active Patients',
//                         style: GoogleFonts.shanti(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w900,
//                           fontSize: 15.h,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: ScrollablePatientTable(),
//               )
//
//
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 10),
//               //   child: CourseList(),
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 10.w, right: 10.w),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Text(
//               //         "My Patients",
//               //         style: GoogleFonts.shanti(
//               //           color: Colors.blueGrey,
//               //           fontWeight: FontWeight.w700,
//               //           fontSize: 17.h,
//               //         ),
//               //       ),
//               //       Text(
//               //         "View all",
//               //         style: GoogleFonts.shanti(
//               //           color: Colors.blueGrey,
//               //           fontWeight: FontWeight.w500,
//               //           fontSize: 12.h,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 10),
//               //   child: QuizList(),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));
//         },
//         backgroundColor: Colors.white,
//         child: SvgPicture.asset(
//           'assets/images/chat_outline.svg', // Replace with your SVG path
//           width: 30, // Adjust size as needed
//           height: 30,
//         ),
//       ),
//     );
//   }
// }
// //