import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Slot_Create_Controller.dart';

class CreateSlotScreen extends StatefulWidget {
  final int drId;
  final String drName;
  final String token;
  final String role;

  const CreateSlotScreen({
    super.key,
    required this.drId,
    required this.drName,
    required this.role, required this.token,
  });

  @override
  State<CreateSlotScreen> createState() => _CreateSlotScreenState();
}

class _CreateSlotScreenState extends State<CreateSlotScreen> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();

  final CreateSlotController slotController = Get.put(CreateSlotController());

  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  @override
  void initState() {
    super.initState();

    slotController.fetchSlots(
      date: slotController.selectedDate.value,
      doctorName: widget.drName, token:widget.token,
    );

    slotController.selectedDate.value = DateTime.now();
  }

  Future<void> _selectFromTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        fromTime = picked;
      });
    }
  }

  Future<void> _selectToTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        toTime = picked;
      });
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '--:--';
    final hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          border: Border.all(
                            color: Colors.blue,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 320.w, // Set a max width constraint
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                widget.drName.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "(${widget.role})",
                            style: TextStyle(
                              fontSize: 12.h,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Obx(() => EasyInfiniteDateTimeLine(
                  selectionMode: SelectionMode.autoCenter(),
                  activeColor: const Color(0xFF51C2B9),
                  controller: _controller,
                  firstDate: DateTime(2025, 05, 01),
                  focusDate: slotController.selectedDate.value,
                  lastDate: DateTime(2030, 01, 01),
                  dayProps: EasyDayProps(
                    todayHighlightStyle: TodayHighlightStyle.withBackground,
                    todayHighlightColor: Color(0xFFB9F9F4),
                  ),
                  onDateChange: (selectedDate) {
                    slotController.selectedDate.value = selectedDate;
                    slotController.fetchSlots(
                      date: slotController.selectedDate.value,
                      doctorName: widget.drName, token: widget.token,
                    );
                  },
                )),
                SizedBox(height: 20),

                /// Slot List
                /// Slot List
                Obx(() {
                  if (slotController.isLoading.value) {
                    return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Color(0xFF51C2B9),
                              )),
                        ));
                  }
                  if (slotController.availableSlots.length == 0) {
                    return Center(
                      child: Text(
                        'No slots available',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Wrap(
                      children: slotController.availableSlots.map((slot) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF51C2B9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            slot,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                }),

                SizedBox(height: 25),

                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Create slots",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// From Time
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => _selectFromTime(context),
                            child: Ink(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "From: ${_formatTime(fromTime)}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      /// To Time
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => _selectToTime(context),
                            child: Ink(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "To: ${_formatTime(toTime)}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                /// Create Slot Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      child: InkWell(
                        highlightColor: Color(0xFF51C2B9),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        onTap: () async {
                          print('fksjflsjflsdjflsjdlf');
                          if (fromTime != null && toTime != null) {
                            print('clicked');

                            slotController.createSlot(
                                date: slotController.selectedDate.value
                                    .toString(),
                                doctorId: widget.drId,
                                fromtime: fromTime,
                                totime: toTime,
                                doctorName: widget.drName, token:widget.token);

                          } else {
                            Get.snackbar('Error', 'Please select time range',
                                snackPosition: SnackPosition.BOTTOM,margin: const EdgeInsets.only(
                                  bottom: 10,
                                  left: 8,
                                  right: 8),);

                          }

                        },
                        child: Ink(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colorutils.userdetailcolor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                                "Create Slot",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}