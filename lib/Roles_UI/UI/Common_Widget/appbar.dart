import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:patient/Roles_UI/UI/Common_Widget/popups.dart';
import 'package:patient/utils/color_util.dart';
import 'package:text_scroll/text_scroll.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String image;
  final bool isWelcome;
  final bool bellicon;
  final bool notificationcount;

  const UserDetails({
    super.key,
    required this.isWelcome,
    required this.bellicon,
    required this.notificationcount,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white, // Inside color as white
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),

          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.white],
            // Adjust colors to match your design
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
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 12.w),

                  CircleAvatar(
                    radius: 29.r, // Ensure the radius is responsive
                    backgroundColor: Colors.transparent,
                    child: Lottie.asset(
                      "assets/images/Splash ScreenLQ.json",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 29.r, // Ensure the radius is responsive
                  //   backgroundColor: Colors.transparent,
                  //   child: ClipOval(
                  //     child: Image.asset(
                  //       "assets/images/Utaram3d_Logo.png",
                  //       fit: BoxFit.cover,
                  //       // Ensures the image is properly scaled and centered
                  //       width: 54.r,
                  //       // Double the inner radius to cover full area
                  //       height: 54.r,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 5.w),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isWelcome ? 'Welcome!' : 'Hello,',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.h,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                        Container(
                          child: TextScroll(
                            name.toUpperCase(),
                            mode: TextScrollMode.bouncing,
                            velocity:
                                const Velocity(pixelsPerSecond: Offset(50, 0)),
                            delayBefore: const Duration(seconds: 1),
                            pauseBetween: const Duration(seconds: 2),
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 15.h,
                              color: Colors.blueGrey,
                            ),
                            textAlign: TextAlign.center,
                            selectable: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  if (bellicon)
                    GestureDetector(
                      onTap: () {
                        Get.snackbar('Failed', 'Feature is under Maintenance',
                            snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.only(
                              bottom: 70,
                              left: 8,
                              right: 8),);
                      },
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 5.w, top: 5.h),
                              child: bellicon
                                  ? SvgPicture.asset(
                                      'assets/images/bell 1.svg',
                                      color: Colors.blueGrey,
                                      width: 28.h,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : const Text("")),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 15.h,
                              height: 15.h,
                              padding: const EdgeInsets.all(2).w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.h,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: () {
                      ProductAppPopUps.logOutPopUp(context: context);

                    },
                    child: SvgPicture.asset(
                      'assets/images/logout.svg',
                      color: Colors.blueGrey,
                      width: 30.h,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 26.r,
                  //   child: CircleAvatar(
                  //     radius: 25.r,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(100).r,
                  //       child: CachedNetworkImage(
                  //         imageUrl:
                  //         "https://media.istockphoto.com/id/1029035836/photo/ai-robot-thinking.jpg?s=612x612&w=0&k=20&c=Lf-nilserdw8BVnHPKtkkSbw7Pcp5p7KI_V9CAlzqQI=",
                  //         fit: BoxFit.fill,
                  //         placeholder: (context, url) =>
                  //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                  //         errorWidget: (context, url, error) =>
                  //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 12.w),
                ],
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20,top: 12,bottom: 10),
              //   child: Container(
              //     height: 50.h,
              //     decoration: const BoxDecoration(
              //         border: Border(),
              //         borderRadius: BorderRadius.all(Radius.circular(30))),
              //     width: double.infinity,
              //     child: TextFormField(
              //       autofocus: true,
              //       // controller: textcontroller,
              //       onChanged: (value) async {
              //
              //       },
              //       validator: (val) =>
              //       val!.isEmpty ? 'Enter the Topic' : null,
              //       cursorColor: Colors.grey,
              //       keyboardType: TextInputType.text,
              //       decoration: InputDecoration(
              //           hintStyle: const TextStyle(color: Colors.grey),
              //           hintText: "Search Patients",
              //           prefixIcon: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: SizedBox(
              //                 height: 25,
              //                 width: 25,
              //                 child: SvgPicture.asset(
              //                     "assets/images/MagnifyingGlass.svg")),
              //           ),
              //           contentPadding: const EdgeInsets.symmetric(
              //               vertical: 10.0, horizontal: 25.0),
              //           border: const OutlineInputBorder(
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(2.0),
              //             ),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide:
              //             BorderSide(color: Colors.grey.withOpacity(0.2)),
              //             borderRadius: const BorderRadius.all(Radius.circular(30)),
              //           ),
              //           focusedBorder: const OutlineInputBorder(
              //             borderSide: BorderSide(
              //                 color: Color.fromRGBO(230, 236, 254, 8),
              //                 width: 1.0),
              //             borderRadius: BorderRadius.all(Radius.circular(30)),
              //           ),
              //           fillColor: Colors.green[50],
              //           filled: true),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}

class ThoughtOfTheDayWidget extends StatelessWidget {
  final String text;
  final String author;
  final String svgPath;
  final VoidCallback? onReadMore;

  const ThoughtOfTheDayWidget({
    Key? key,
    required this.text,
    required this.svgPath,
    this.onReadMore, required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20,top: 10,bottom: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                      fontStyle: FontStyle.italic),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      author,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: onReadMore,
                //   child: Text(
                //     "read more........",
                //     style: TextStyle(fontSize: 16, color: Colors.green),
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            top: -30,
            right: -10,
            child: SvgPicture.asset(
              svgPath,
              color:Colorutils.userdetailcolor,
              height: 60,
              width: 60,
            ),
          ),
          // Positioned(
          //   top: -30,
          //   right: -10,
          //   child: Lottie.asset(
          //
          //     "assets/images/Splash ScreenLQ.json",
          //
          //     fit: BoxFit.fitHeight,
          //   ),
          // ),
          // Positioned(
          //   top: -10,
          //   left: -10,
          //   child: SvgPicture.asset(
          //     "assets/images/Lines.svg",
          //     color: Colors.green,
          //     height: 100,
          //     width: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}
