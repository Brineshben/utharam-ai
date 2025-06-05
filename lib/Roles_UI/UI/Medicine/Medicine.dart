import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Controller/Medicine_Controller/AddMedicineController.dart';
import 'package:patient/Model/Medicine_model/AddMedicineModel.dart';
import '../../../../utils/color_util.dart';
import '../../../Controller/Medicine_Controller/Brand_Controller.dart';
import '../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../Common_Widget/connectivity.dart';
import '../Register_Page/Register.dart';
import 'Medicine_Widgets.dart';

class Medicine extends StatefulWidget {
  final String patientToken;
  final int patientId;

  const Medicine(
      {super.key, required this.patientToken, required this.patientId});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  bool spinner = false;

  // TextEditingController phoneNumber = TextEditingController();
  // List<String> data = [];
  // List<TextEditingController> controllerList= List.generate(
  //   8,
  //   (index) {
  //     return TextEditingController();
  //   },
  // );
  //
  // void add(String value) {
  //   setState(() {
  //     data.add(value);
  //   });
  // }
@override
  void initState() {
  Get.find<ParticularMedicinelistController>().particularMedicineListDataz(widget.patientToken);
    super.initState();
  }
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
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "ADD MEDICINE",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: GetX<AddMedicineController>(
                  builder: (AddMedicineController controller) {
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: controller.addMedicineData.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Card(
                        margin: EdgeInsets.all(10),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade50,
                                Colors.white,
                                Colors.blue.shade50,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8,bottom: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          Get.find<AddMedicineController>().addMedicineData.value.remove(
                                            MedicinesList(),
                                          );
                                          Get.find<AddMedicineController>().addMedicineData.refresh();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                GetX<MedicineController>(
                                  builder:
                                      (MedicineController medicineController) {
                                    return buildDropdownSearchField(
                                      hintText: "Select Medicine",
                                      items: medicineController.medicineList
                                          .map((e) =>
                                              e?.name ??
                                              '') // Assuming your model has 'medicineName'
                                          .where((name) => name
                                              .isNotEmpty) // To filter empty names
                                          .toList(),
                                      // controller: phoneNumber,
                                      validation: true,
                                      index: index,
                                      type: 'medicine',
                                    );
                                  },
                                ),
                                GetX<BrandController>(
                                  builder: (BrandController brandController) {
                                    return buildDropdownSearchField(
                                        hintText: "Select Brand",
                                        items: brandController.brandList
                                            .map((e) =>
                                                e?.name ??
                                                '') // Assuming your model has 'medicineName'
                                            .where((name) => name
                                                .isNotEmpty) // To filter empty names
                                            .toList(),
                                        // controller: phoneNumber,
                                        validation: true,
                                        index: index,
                                        type: 'brand');
                                  },
                                ),
                                GetX<FrequencyController>(
                                  builder: (FrequencyController
                                      frequencyController) {
                                    return buildDropdownSearchField(
                                        hintText: "Select Frequency",
                                        items: frequencyController.frequencyList
                                            .map((e) =>
                                                e?.name ??
                                                '') // Assuming your model has 'medicineName'
                                            .where((name) => name
                                                .isNotEmpty) // To filter empty names
                                            .toList(),
                                        // controller: phoneNumber,
                                        validation: true,
                                        index: index,
                                        type: 'frequency');
                                  },
                                ),
                                Row(
                                  children: [
                                    // Expanded(
                                    //   child: buildTextFieldMedicine(
                                    //       "Strength", "", false, index, false, TextEditingController(text: controller.addMedicineData.value[index].strength)),
                                    // ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: controller.medicineControllers[index]['Strength'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .strength = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Strength",
                                              labelText: "Strength",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: controller.medicineControllers[index]['Dosage'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .dosage = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Dosage",
                                              labelText: "Dosage",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                // buildDropdownSearchField(
                                //   hintText: "UOM",
                                //   items: [
                                //     "ML",
                                //     "ML",
                                //   ],
                                //   controller: controllerList[2],
                                //   validation: true,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: controller.medicineControllers[index]['UOM'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .uom = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "UOM",
                                              labelText: "UOM",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ), Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: controller.medicineControllers[index]['Route'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .route = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Route",
                                              labelText: "Route",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allows only numbers
                                            ],
                                            keyboardType: TextInputType.number,

                                            controller: controller.medicineControllers[index]['Period'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .period = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Period",
                                              labelText: "Period",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ), Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allows only numbers
                                            ],
                                            keyboardType: TextInputType.number,

                                            controller: controller.medicineControllers[index]['Quantity'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .quantity = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Quantity",
                                              labelText: "Quantity",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          height: 45.h,
                                          width: double.infinity,
                                          child: TextFormField(

                                            controller: controller.medicineControllers[index]['Remarks'],
                                            validator: false
                                                ? (val) => val!.trim().isEmpty ? 'Please enter Strength' : null
                                                : null,
                                            obscureText: false,
                                            onChanged: (value) {
                                              controller
                                                  .addMedicineData
                                                  .value[index]
                                                  .remarks = value;
                                              controller.addMedicineData.refresh();
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Remarks",
                                              labelText: "Remarks",
                                              labelStyle: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar:Container(
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.white],
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
        child: spinner
            ?  Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Center(child: spinkitNew)
        )
            :  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  setState(() {
                    spinner = true;
                  });

                  await Get.find<AddMedicineController>().addmedicineDataz(
                    widget.patientToken,
                    widget.patientId,
                  );

                  setState(() {
                    spinner = false;
                  });
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
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.inter(
                        fontSize: 16.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:      spinner
      //     ? Container(
      //
      //     child: Center(child: CircularProgressIndicator())): Container(
      //   height: 70.h,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(15),
      //       topLeft: Radius.circular(15),
      //     ),
      //     gradient: LinearGradient(
      //       colors: [Colors.teal.shade50, Colors.white],
      //       // Adjust colors to match your design
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.teal.withOpacity(0.3),
      //         blurRadius: 0.1,
      //         spreadRadius: 0.1,
      //         offset: Offset(0, 1),
      //       ),
      //     ],
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //
      //         Center(
      //           child: GestureDetector(
      //             onTap: () async {
      //               spinner=true;
      //
      //               Get.find<AddMedicineController>().addmedicineDataz(
      //                   widget.patientToken, widget.patientId);
      //
      //
      //               //   },
      //               // );
      //             },
      //             child: Container(
      //               width: 180.w,
      //               height: 45.h,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(30.r),
      //                 border: Border.all(
      //                   color: Colorutils.userdetailcolor,
      //                   width: 0.8,
      //                 ),
      //               ),
      //               // width: 250.w,
      //               child: Center(
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Text(
      //                       'SUBMIT',
      //                       style: GoogleFonts.inter(
      //                         fontSize: 16.h,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          print("sjdhjfhjfwhjf");

          Get.find<AddMedicineController>().addMedicineData.value.add(
                MedicinesList(),
              );

          Get.find<AddMedicineController>().medicineControllers.add(
            {
              "Strength": TextEditingController(),
              "Dosage": TextEditingController(),
              "UOM": TextEditingController(),
              "Route": TextEditingController(),
              "Period": TextEditingController(),
              "Quantity": TextEditingController(),
              "Remarks": TextEditingController(),
            },
          );

          Get.find<AddMedicineController>().addMedicineData.refresh();
          // add("Medicine ${data.length + 1}");
        },
        child: Icon(Icons.add,color: Colorutils.userdetailcolor,),
      ),
    );
  }
}

// Widget buildTextFieldMedicine(String hintText, String svgAssetPath,
//     bool isPassword, TextEditingController controller, bool validation) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
//     child: SizedBox(
//       height: 40, // Set your desired height
//       width: double.infinity, // Or set a specific width like 300
//       child: TextFormField(
//         validator: validation
//             ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
//             : null,
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hintText,
//           labelText: hintText,
//           labelStyle: TextStyle(
//             fontSize: 15.h,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue.shade900,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//           ),
//           // prefixIcon: Padding(
//           //   padding: const EdgeInsets.only(left: 5,right: 1,top: 10,bottom: 10),
//           //   child: SvgPicture.asset(
//           //     svgAssetPath,
//           //     width: 5.w,
//           //     height: 5.h,
//           //     color: Colors.grey,
//           //   ),
//           // ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colorutils.userdetailcolor),
//           ),
//         ),
//       ),
//     ),
//   );
// }
final spinkitNew = SpinKitWave(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colorutils.userdetailcolor,
        ));
  },
);