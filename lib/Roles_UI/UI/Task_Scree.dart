// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:patient/UI/taskList.dart';
// import 'package:patient/utils/color_util.dart';
//
//
// class TaskScreen extends StatelessWidget {
//   const TaskScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3, // Number of tabs
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//
//
//             Padding(
//               padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
//               child: Container(
//                 height: 45,
//                 width: 380,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colorutils.tabBorderColor, // Border color
//                     width: 1, // Border width
//                   ),
//                   color: Colorutils.tabColor,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: TabBar(
//                     dividerColor: Colors.transparent, // Remove bottom line
//
//                     indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: Colors.white,
//                     ),
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicatorPadding: EdgeInsets.zero,
//                     indicatorWeight: 0.0,
//                     labelColor:Colors.blueGrey,
//                     unselectedLabelColor: Colors.blueGrey,
//                     labelStyle:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     unselectedLabelStyle: const TextStyle(fontSize: 14),
//                     tabs:  [
//                       _buildTab("My Tasks", "74", true,113.h),
//                       _buildTab("Created by", "6", false,140.h),
//                       _buildTab("Team", "15", false,91.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   TaskListScreen(),
//                   Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
//                   Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget _buildTab(String title, String count, bool isSelected, double width) {
//   return SizedBox(
//     width: width,
//     child: Tab(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,style: TextStyle(
//             fontSize: 12,color: Colors.black
//           ),),
//           const SizedBox(width: 5),
//           Container(
//             width: 20,
//             height: 18,
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.purple : Colors.grey[300],
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Center(
//               child: Text(
//                 count,
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.black,
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
