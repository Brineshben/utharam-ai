import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../../../../Service/Api_Service.dart';
import '../../../../utils/color_util.dart';
import '../../../UI/Common_Widget/DateFormat.dart';
import '../../../UI/Common_Widget/Patient_cards.dart';
import '../../../UI/Common_Widget/popups.dart';
import '../../../UI/Medicine/Medicine_List_Widget.dart';

class Medicinelistjunior extends StatefulWidget {
  final String token;

  const Medicinelistjunior({super.key, required this.token});

  @override
  State<Medicinelistjunior> createState() => _MedicinelistjuniorState();
}

class _MedicinelistjuniorState extends State<Medicinelistjunior> {
  @override
  void initState() {
    Get.find<ParticularMedicinelistController>()
        .particularMedicineListDataz(widget.token);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
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
          child: Center(
            child: Column(children: [
                        Padding(
            padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suggested Medicine List".toUpperCase(),
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
                child: GetX<ParticularMedicinelistController>(
                  builder: (ParticularMedicinelistController controller) {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colorutils.userdetailcolor,
                        ),
                      );
                    }
                    if (controller.particularMedicineList.isEmpty) {
                      return Padding(
                          padding:
                          const EdgeInsets.only(top: 40),
                          child: Center(
                            child: const Text(
                              "No Medicine Assigned Yet",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic),
                            ),
                          ));
                    } else {
                      return  SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.particularMedicineList.length,
                          itemBuilder: (context, index) {
                            final medicine = controller.particularMedicineList[index];

                            return Padding(
                              padding:
                              EdgeInsets.only(top: 1.h, left: 10.w, right: 8.w),
                              child: MedicineCard(
                                brandName: medicine?.medicine ?? "----",
                                frequency: medicine?.frequency ?? "",
                                dosage: medicine?.dosage ?? "",
                                date: formatDate2(medicine?.dateTime ?? ""),
                              ),
                            );

                          },
                        ),
                      );


                    }
                  },
                ),
              ),

                      ]),
          )),
    );
  }
}
