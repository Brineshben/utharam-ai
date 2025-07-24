// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../Controller/Medicine_Controller/Brand_Controller.dart';
// import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
// import '../../../utils/color_util.dart';
// import '../SplashScreen/splash.dart';
//
//
//
// class Editmedicine extends StatefulWidget {
// final String medicine;
// final String brand ;
// final String frequency;
// final String Strength;
// final String dosage;
// final String uom;
// final String route;
// final String remarks;
// final int period;
// final int quality;
//
//
//   const Editmedicine(
//       {super.key, required this.medicine, required this.brand, required this.frequency, required this.Strength, required this.dosage, required this.uom, required this.route, required this.remarks, required this.period, required this.quality});
//
//   @override
//   _EditmedicineState createState() => _EditmedicineState();
// }
//
// class _EditmedicineState extends State<Editmedicine> {
//   TextEditingController _messageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blue.shade50,
//               Colors.white,
//               Colors.white,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Text
//             Padding(
//               padding: const EdgeInsets.only(top: 50, left: 20),
//               child: Text(
//                 "EDIT MEDICINE",
//                 style: GoogleFonts.shanti(
//                   color: Colors.blueGrey,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 20.h,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 5, right: 5),
//               child: Card(
//                 margin: EdgeInsets.all(10),
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.blue.shade50,
//                         Colors.white,
//                         Colors.blue.shade50,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//
//                           Padding(
//                             padding: const EdgeInsets.all(4),
//                             child: SizedBox(
//                               height: 60,
//                               width: double.infinity,
//                               child: Obx(() {
//                                 final medicineController = Get.find<MedicineController>();
//
//                                 return DropdownSearch<String>(
//                                   items: medicineController.medicineList
//                                       .map((e) => e?.name ?? '')
//                                       .where((name) => name.isNotEmpty)
//                                       .toList(),
//                                   selectedItem: null, // You can replace this with your controller logic
//                                   onChanged: (value) {
//                                     // Handle selection
//                                   },
//                                   dropdownDecoratorProps: DropDownDecoratorProps(
//                                     dropdownSearchDecoration: InputDecoration(
//                                       hintText: "Select Medicine",
//                                       labelText: "Select Medicine",
//                                       labelStyle: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blueGrey,
//                                       ),
//                                       contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal, width: 1),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal),
//                                       ),
//                                     ),
//                                   ),
//                                   popupProps: PopupProps.menu(
//                                     showSearchBox: true,
//                                     itemBuilder: (context, item, isSelected) => ListTile(
//                                       title: Text(item),
//                                     ),
//                                     constraints: BoxConstraints(maxHeight: 250),
//                                     searchFieldProps: TextFieldProps(
//                                       decoration: InputDecoration(
//                                         hintText: "Search Medicine",
//                                         prefixIcon: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: Icon(Icons.search, color: Colors.teal),
//                                         ),
//                                         contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal, width: 1.0),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                       ),
//                                     ),
//                                   ),
//                                   validator: (val) =>
//                                   val == null || val.trim().isEmpty ? 'Please select a Medicine' : null,
//                                 );
//                               }),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(4),
//                             child: SizedBox(
//                               height: 60,
//                               width: double.infinity,
//                               child: Obx(() {
//                                 final brandController = Get.find<BrandController>();
//
//                                 return DropdownSearch<String>(
//                                   items: brandController.brandList
//                                       .map((e) => e?.brandName ?? '')
//                                       .where((name) => name.isNotEmpty)
//                                       .toList(),
//                                   selectedItem: null, // You can replace this with your controller logic
//                                   onChanged: (value) {
//                                     // Handle selection
//                                   },
//                                   dropdownDecoratorProps: DropDownDecoratorProps(
//                                     dropdownSearchDecoration: InputDecoration(
//                                       hintText: "Select Brand",
//                                       labelText: "Select Brand",
//                                       labelStyle: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blueGrey,
//                                       ),
//                                       contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal, width: 1),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal),
//                                       ),
//                                     ),
//                                   ),
//                                   popupProps: PopupProps.menu(
//                                     showSearchBox: true,
//                                     itemBuilder: (context, item, isSelected) => ListTile(
//                                       title: Text(item),
//                                     ),
//                                     constraints: BoxConstraints(maxHeight: 250),
//                                     searchFieldProps: TextFieldProps(
//                                       decoration: InputDecoration(
//                                         hintText: "Search Brand",
//                                         prefixIcon: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: Icon(Icons.search, color: Colors.teal),
//                                         ),
//                                         contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal, width: 1.0),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                       ),
//                                     ),
//                                   ),
//                                   validator: (val) =>
//                                   val == null || val.trim().isEmpty ? 'Please select a brand' : null,
//                                 );
//                               }),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(4),
//                             child: SizedBox(
//                               height: 60,
//                               width: double.infinity,
//                               child: Obx(() {
//                                 final brandController = Get.find<BrandController>();
//
//                                 return DropdownSearch<String>(
//                                   items: brandController.brandList
//                                       .map((e) => e?.brandName ?? '')
//                                       .where((name) => name.isNotEmpty)
//                                       .toList(),
//                                   selectedItem: null, // You can replace this with your controller logic
//                                   onChanged: (value) {
//                                     // Handle selection
//                                   },
//                                   dropdownDecoratorProps: DropDownDecoratorProps(
//                                     dropdownSearchDecoration: InputDecoration(
//                                       hintText: "Select Brand",
//                                       labelText: "Select Brand",
//                                       labelStyle: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blueGrey,
//                                       ),
//                                       contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal, width: 1),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(8),
//                                         borderSide: BorderSide(color: Colors.teal),
//                                       ),
//                                     ),
//                                   ),
//                                   popupProps: PopupProps.menu(
//                                     showSearchBox: true,
//                                     itemBuilder: (context, item, isSelected) => ListTile(
//                                       title: Text(item),
//                                     ),
//                                     constraints: BoxConstraints(maxHeight: 250),
//                                     searchFieldProps: TextFieldProps(
//                                       decoration: InputDecoration(
//                                         hintText: "Search Brand",
//                                         prefixIcon: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: Icon(Icons.search, color: Colors.teal),
//                                         ),
//                                         contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(color: Colors.teal, width: 1.0),
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                       ),
//                                     ),
//                                   ),
//                                   validator: (val) =>
//                                   val == null || val.trim().isEmpty ? 'Please select a brand' : null,
//                                 );
//                               }),
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(4),
//                             child: SizedBox(
//                               height: 60,
//                               width: double.infinity,
//                               child: DropdownSearch<String>(
//                                 items: ["Option 1", "Option 2", "Option 3"],
//                                 selectedItem: "Option 1",
//                                 onChanged: (value) {},
//                                 dropdownDecoratorProps: DropDownDecoratorProps(
//                                   dropdownSearchDecoration: InputDecoration(
//                                     hintText: "Select Option",
//                                     labelText: "Select Option",
//                                     labelStyle: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blueGrey,
//                                     ),
//                                     contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide(color: Colors.teal, width: 1),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide(color: Colors.teal),
//                                     ),
//                                   ),
//                                 ),
//                                 popupProps: PopupProps.menu(
//                                   showSearchBox: true,
//                                   itemBuilder: (context, item, isSelected) => ListTile(
//                                     title: Text(item),
//                                   ),
//                                   constraints: BoxConstraints(maxHeight: 250),
//                                   searchFieldProps: TextFieldProps(
//                                     decoration: InputDecoration(
//                                       hintText: "Search Option",
//                                       prefixIcon: Padding(
//                                         padding: const EdgeInsets.all(5.0),
//                                         child: Icon(Icons.search, color: Colors.teal),
//                                       ),
//                                       contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.teal),
//                                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.teal, width: 1.0),
//                                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                                       ),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (val) =>
//                                 val == null || val.trim().isEmpty ? 'Please select an option' : null,
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               // Expanded(
//                               //   child: buildTextFieldMedicine(
//                               //       "Strength", "", false, index, false, TextEditingController(text: controller.addMedicineData.value[index].strength)),
//                               // ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//                                       controller:_messageController,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Strength",
//                                         labelText: "Strength",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(1),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//
//                                       controller:_messageController,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Dosage",
//                                         labelText: "Dosage",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                           // buildDropdownSearchField(
//                           //   hintText: "UOM",
//                           //   items: [
//                           //     "ML",
//                           //     "ML",
//                           //   ],
//                           //   controller: controllerList[2],
//                           //   validation: true,
//                           // ),
//                           Row(
//                             children: [
//
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: DropdownButtonFormField<String>(
//                                       value: null,
//                                       items: ['ML', 'Nos'].map((String unit) {
//                                         return DropdownMenuItem<String>(
//                                           value: unit,
//                                           child: Text(unit),
//                                         );
//                                       }).toList(),
//                                       onChanged: (value) {
//
//                                       },
//                                       validator: (value) =>
//                                       value == null || value.trim().isEmpty ? 'Please select UOM' : null,
//                                       decoration: InputDecoration(
//                                         hintText: "Select UOM",
//                                         labelText: "UOM",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//                                       controller:_messageController,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Route",
//                                         labelText: "Route",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//                                       inputFormatters: [
//                                         FilteringTextInputFormatter.digitsOnly, // Allows only numbers
//                                       ],
//                                       keyboardType: TextInputType.number,
//
//                                       controller:_messageController ,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Period",
//                                         labelText: "Period",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ), Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//                                       inputFormatters: [
//                                         FilteringTextInputFormatter.digitsOnly, // Allows only numbers
//                                       ],
//                                       keyboardType: TextInputType.number,
//
//                                       controller:_messageController,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Quantity",
//                                         labelText: "Quantity",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: TextFormField(
//
//                                       controller:_messageController,
//                                       validator: false
//                                           ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
//                                           : null,
//                                       obscureText: false,
//                                       onChanged: (value) {
//
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: "Remarks",
//                                         labelText: "Remarks",
//                                         labelStyle: TextStyle(
//                                           fontSize: 15.h,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blueGrey,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//
//
//
//
//
//
//
//
//
//
//
//
//       ),
//       bottomNavigationBar:Container(
//         height: 70.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15),
//             topLeft: Radius.circular(15),
//           ),
//           gradient: LinearGradient(
//             colors: [Colors.teal.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.teal.withOpacity(0.3),
//               blurRadius: 0.1,
//               spreadRadius: 0.1,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () async {
//
//                 },
//                 child: Container(
//                   width: 180.w,
//                   height: 45.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30.r),
//                     border: Border.all(
//                       color: Colorutils.userdetailcolor,
//                       width: 0.8,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'SUBMIT',
//                       style: GoogleFonts.inter(
//                         fontSize: 16.h,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/Medicine_Controller/Brand_Controller.dart';
import '../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../utils/color_util.dart';

class Editmedicine extends StatefulWidget {
  final String medicine;
  final String token;
  final String brand;
  final String frequency;
  final String Strength;
  final String dosage;
  final String uom;
  final String route;
  final String remarks;
  final int period;
  final int quality;

  const Editmedicine({
    super.key,
    required this.medicine,
    required this.brand,
    required this.frequency,
    required this.Strength,
    required this.dosage,
    required this.uom,
    required this.route,
    required this.remarks,
    required this.period,
    required this.quality,
    required this.token,
  });

  @override
  _EditmedicineState createState() => _EditmedicineState();
}

class _EditmedicineState extends State<Editmedicine> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController strengthController;
  late TextEditingController dosageController;
  late TextEditingController routeController;
  late TextEditingController remarksController;
  late TextEditingController periodController;
  late TextEditingController quantityController;

  String? selectedMedicine;
  String? selectedBrand;
  String? selectedFrequency;
  String? selectedUOM;

  @override
  void initState() {
    super.initState();
    strengthController = TextEditingController(text: widget.Strength);
    dosageController = TextEditingController(text: widget.dosage);
    routeController = TextEditingController(text: widget.route);
    remarksController = TextEditingController(text: widget.remarks);
    periodController = TextEditingController(text: widget.period.toString());
    quantityController = TextEditingController(text: widget.quality.toString());

    selectedMedicine = widget.medicine;
    selectedBrand = widget.brand;
    selectedFrequency = widget.frequency;
    selectedUOM = widget.uom;
  }

  @override
  void dispose() {
    strengthController.dispose();
    dosageController.dispose();
    routeController.dispose();
    remarksController.dispose();
    periodController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EDIT MEDICINE",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          final medicineController =
                              Get.find<MedicineController>();
                          final brandController = Get.find<BrandController>();

                          // Build a list of medicine names for display
                          final medicineItems = medicineController.medicineList
                              .where((e) => e?.name?.isNotEmpty ?? false)
                              .map((e) => e!.name!)
                              .toList();

                          return DropdownSearch<String>(
                            items: medicineItems,
                            selectedItem: selectedMedicine,
                            onChanged: (value) async {
                              // Update selected medicine name
                              // setState(() => selectedMedicine = value);
                              setState(() {
                                selectedMedicine = value;
                                selectedBrand = null; // ✅ Clear brand selection
                              });
                              // Find selected medicine object
                              final selected = medicineController.medicineList
                                  .firstWhereOrNull(
                                      (element) => element?.name == value);

                              // Short delay (optional)
                              await Future.delayed(
                                  const Duration(milliseconds: 50));

                              // Fetch brand data by selected medicine id
                              if (selected?.id != null) {
                                await brandController.brandDataz(
                                    widget.token, selected!.id!);
                              }
                            },
                            dropdownDecoratorProps:
                                _buildDropdownDecorator("Select Medicine"),
                            popupProps: _buildPopupProps("Search Medicine"),
                            validator: _dropdownValidator,
                          );
                        }),

                        SizedBox(height: 8),

                        // Brand Dropdown
                        Obx(() {
                          final brandController = Get.find<BrandController>();
                          return DropdownSearch<String>(
                            items: brandController.brandList
                                .map((e) => e?.brandName ?? '')
                                .where((name) => name.isNotEmpty)
                                .toList(),
                            selectedItem: selectedBrand,
                            onChanged: (value) =>
                                setState(() => selectedBrand = value),
                            dropdownDecoratorProps:
                                _buildDropdownDecorator("Select Brand"),
                            popupProps: _buildPopupProps("Search Brand"),
                            validator: _dropdownValidator,
                          );
                        }),
                        SizedBox(height: 8),
                        Obx(() {
                          final frequencyController =
                              Get.find<FrequencyController>();
                          return DropdownSearch<String>(
                            items: frequencyController.frequencyList
                                .map((e) => e?.name ?? '')
                                .where((name) => name.isNotEmpty)
                                .toList(),
                            selectedItem: selectedFrequency,
                            onChanged: (value) =>
                                setState(() => selectedFrequency = value),
                            dropdownDecoratorProps:
                                _buildDropdownDecorator("Select Frequency"),
                            popupProps: _buildPopupProps("Search Frequency"),
                            validator: _dropdownValidator,
                          );
                        }),

                        SizedBox(height: 8),

                        // Strength & Dosage
                        Row(children: [
                          Expanded(
                              child: _buildTextField(
                                  "Strength", strengthController)),
                          SizedBox(width: 6),
                          Expanded(
                              child:
                                  _buildTextField("Dosage", dosageController)),
                        ]),

                        // UOM & Route
                        Row(children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedUOM,
                              items: ['ML', 'Nos'].map((String unit) {
                                return DropdownMenuItem<String>(
                                  value: unit,
                                  child: Text(unit),
                                );
                              }).toList(),
                              onChanged: (value) =>
                                  setState(() => selectedUOM = value),
                              validator: (value) =>
                                  value == null || value.trim().isEmpty
                                      ? 'Please select UOM'
                                      : null,
                              decoration: _inputDecoration("UOM"),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                              child: _buildTextField("Route", routeController)),
                        ]),

                        // Period & Quantity
                        Row(children: [
                          Expanded(
                              child: _buildNumericField(
                                  "Period", periodController)),
                          SizedBox(width: 6),
                          Expanded(
                              child: _buildNumericField(
                                  "Quantity", quantityController)),
                        ]),

                        // Remarks
                        _buildTextField("Remarks", remarksController),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildSubmitButton(),
    );
  }

  DropDownDecoratorProps _buildDropdownDecorator(String label) {
    return DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        labelText: label,
        hintText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  PopupProps<String> _buildPopupProps(String hint) {
    return PopupProps.menu(
      showSearchBox: true,
      itemBuilder: (context, item, isSelected) => ListTile(title: Text(item)),
      searchFieldProps: TextFieldProps(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  String? _dropdownValidator(String? val) {
    if (val == null || val.trim().isEmpty) return 'Please select a value';
    return null;
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildNumericField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: _inputDecoration(label),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      hintText: label,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        gradient: LinearGradient(colors: [Colors.teal.shade50, Colors.white]),
        boxShadow: [
          BoxShadow(color: Colors.teal.withOpacity(0.3), blurRadius: 2)
        ],
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              // Access each controller
              final medicineController = Get.find<MedicineController>();
              final brandController = Get.find<BrandController>();
              final frequencyController = Get.find<FrequencyController>();

              // Match selected values to get the corresponding model and fetch ID
              final selectedMedicineModel = medicineController.medicineList
                  .firstWhereOrNull((e) => e?.name == selectedMedicine);
              final selectedBrandModel = brandController.brandList
                  .firstWhereOrNull((e) => e?.brandName == selectedBrand);
              final selectedFrequencyModel = frequencyController.frequencyList
                  .firstWhereOrNull((e) => e?.name == selectedFrequency);

              // Build your payload with IDs
              final data = {
                "medicine_id": selectedMedicineModel?.id,
                "brand_id": selectedBrandModel?.id,
                "frequency_id": selectedFrequencyModel?.id,
                "strength": strengthController.text.trim(),
                "dosage": dosageController.text.trim(),
                "uom": selectedUOM,
                "route": routeController.text.trim(),
                "remarks": remarksController.text.trim(),
                "period": int.tryParse(periodController.text.trim()) ?? 0,
                "quantity": int.tryParse(quantityController.text.trim()) ?? 0,
              };

              print(data); // Submit this to your API
            }
          },
          child: Container(
            width: 180.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colorutils.userdetailcolor, width: 0.8),
            ),
            child: Center(
              child: Text(
                'SUBMIT',
                style: GoogleFonts.inter(fontSize: 16.h),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
