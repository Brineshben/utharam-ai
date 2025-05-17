import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// class FullScreenPdfViewer extends StatelessWidget {
//   final String assetPath;
//
//   const FullScreenPdfViewer({super.key, required this.assetPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.teal.shade50,
//               Colors.white,
//               Colors.white,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   top: 48.h, bottom: 5.h, left: 20.w, right: 10.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       height: 50.h,
//                       width: 50.h,
//                       decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.9),
//                           border: Border.all(
//                             color: Colors.blue, // Border color
//                             width: 0.1, // Border width
//                           ),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //     color: Colors.grey.withOpacity(0.3),
//                           //     blurRadius: 1,
//                           //     spreadRadius: 0,
//                           //   ),
//                           // ],
//                           borderRadius:
//                           BorderRadius.circular(15).r),
//                       child: Icon(
//                         Icons.arrow_back_ios_sharp,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Text(
//                       "John AI Summary Report",
//                       style: GoogleFonts.shanti(
//                         color: Colors.blueGrey,
//                         fontWeight: FontWeight.w900,
//                         fontSize: 16.h,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(child: SfPdfViewer.asset(assetPath)),
//           ],
//         ),
//       ),
//     );
//   }
// }
class FullScreenPdfViewer extends StatelessWidget {
  final String pdfUrl;

  const FullScreenPdfViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 48.h, bottom: 5.h, left: 20.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          border: Border.all(
                            color: Colors.blue,
                            width: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(15).r),
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "AI Summary Report",
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(child: Expanded(child: SfPdfViewer.network(pdfUrl))),
          ],
        ),
      ),
    );
  }
}
