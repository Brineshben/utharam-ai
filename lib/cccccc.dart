// Padding(
//   padding: const EdgeInsets.all(15.0),
//   child: Row(
//     children: [
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.all(2),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colorutils.userdetailcolor,
//               width: 0.5,
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.teal.shade50,
//                 Colors.white
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: const [
//                 Text('Diagnosis Suggestion',
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blueGrey)),
//                 SizedBox(height: 8),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Major Depressive Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Mental Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Mental Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Mental Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Mental Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Mental Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//                 Text('-Generalise Anxiety Disorder',
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blueGrey)),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(width: 5),
//       Expanded(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colorutils.userdetailcolor,
//                   width: 0.5,
//                 ),
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.teal.shade50,
//                     Colors.white
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                 children: [
//                   Text('MSE Highlights',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blueGrey)),
//                   const SizedBox(height: 5),
//                   Text('-Mental Disorder',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blueGrey)),
//                   Text('-Generalise Anxiety Disorder',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blueGrey)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colorutils.userdetailcolor,
//                   width: 0.5,
//                 ),
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.teal.shade50,
//                     Colors.white
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                 children: [
//                   Text('Flagged Alerts',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blueGrey)),
//                   const SizedBox(height: 5),
//                   Text('-Mental Disorder',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blueGrey)),
//                   Text('-Generalise Anxiety Disorder',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blueGrey)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),



// Padding(
//   padding:
//   EdgeInsets.only(left: 15.w, right: 20.w, top: 20.h),
//   child: GetX<SlotController>(
//     builder: (SlotController controller) {
//       return DropdownButtonFormField(
//         decoration: InputDecoration(
//             hintStyle: TextStyle(
//                 color: Colors.black.withOpacity(0.3)),
//             contentPadding: const EdgeInsets.symmetric(
//                 vertical: 15.0, horizontal: 20.0),
//             hintText: " Select a Slot ",
//             counterText: "",
//             border: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10.0),
//               ),
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(230, 236, 254, 8),
//                 width: 1.0,
//               ),
//               borderRadius:
//               BorderRadius.all(Radius.circular(10.0)),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(230, 236, 254, 8),
//                 width: 1.0,
//               ),
//               borderRadius:
//               BorderRadius.all(Radius.circular(10.0)),
//             ),
//             fillColor: const Color.fromRGBO(230, 236, 254, 8),
//             filled: true),
//         padding:
//         const EdgeInsets.only(left: 10, right: 5).w,
//         hint: const Text(" Select a HOS "),
//         validator: (dynamic value) =>
//         value == null ? 'Field Required' : null,
//         items: controller.slotList
//             .map<DropdownMenuItem<dynamic>>((item) {
//           return DropdownMenuItem<dynamic>(
//             value:
//             '${item?.fromTime}-${item?.toTime}',
//
//             child: Text(
//               item?.fromTime?.toUpperCase() ?? '--',
//               style: const TextStyle(fontSize: 14),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           );
//         }).toList(),
//         value: _hosNameSelected.value,
//         isExpanded: true,
//         onChanged: (dynamic newVal) {
//           _hosNameSelected.value = newVal;
//           // controller.setSelectedHosData(
//           //   hosName: _hosNameSelected.value ?? '--',
//           //   isHos: false,
//           // );
//         },
//       );
//     },
//   ),
// ),


/////
