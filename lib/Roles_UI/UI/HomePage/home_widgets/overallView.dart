import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Controller/SeniorDashboardController.dart';

class Tickets extends StatelessWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SeniorDashboardController>();

    return Obx(() {
      if (controller.isLoading.value) {
        // Show shimmer while loading
        return GridView.builder(
          padding: const EdgeInsets.only(top: 0, left: 8, right: 8).w,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4, // Placeholder shimmer count
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            mainAxisExtent: 70.w,
          ),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade50,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8).w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0).r,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 45.w,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0).r,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        // Show actual data
        return Container(
          padding: const EdgeInsets.only(top: 0, left: 8, right: 8).w,
          child: GridView.builder(
            padding: EdgeInsets.only(top: 0).w,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.seniorList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.w,
              mainAxisExtent: 70.w,
            ),
            itemBuilder: (context, index) {
              final data = controller.seniorList[index];

              return GestureDetector(
                onTap: () {
                  // Handle tap action
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8).w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade50, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.0).r,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 45.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0).r,
                        ),
                        child: Center(
                          child: Text(
                            data?.value.toString() ?? "",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          data?.key ?? "",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
