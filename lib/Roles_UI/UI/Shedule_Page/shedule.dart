import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/color_util.dart';
import 'Upcoming_List.dart';

// class PatientSheduled extends StatelessWidget {
//   const PatientSheduled({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
//               Padding(
//                 padding:  EdgeInsets.only(left: 15,right: 15,top: 25.h),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colorutils.userdetailcolor,
//                     // gradient: LinearGradient(
//                     //   colors: [Colors.green.shade100,Colors.blue.shade100], // Adjust colors to match your design
//                     //   begin: Alignment.topLeft,
//                     //   end: Alignment.bottomRight,
//                     // ),
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: TabBar(
//                       dividerColor: Colors.transparent, // Remove bottom line
//
//                       indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: Colors.white,
//                       ),
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       indicatorPadding: EdgeInsets.zero,
//                       indicatorWeight: 0.0,
//                       labelColor:Colors.blueGrey,
//                       unselectedLabelColor: Colors.white,
//                       labelStyle:
//                       const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       unselectedLabelStyle: const TextStyle(fontSize: 14),
//                       tabs: const [
//                         Tab(text: 'Upcoming'),
//                         Tab(text: 'Past'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     PatientExpandableCardList()  ,
//                     PatientExpandableCardList()  ,
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
