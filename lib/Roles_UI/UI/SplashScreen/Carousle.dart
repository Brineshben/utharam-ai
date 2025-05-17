import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselItem {
  final Widget content;

  CarouselItem({required this.content});
}

class CarouseWidget extends StatefulWidget {
  final List<CarouselItem> carouselItems;

  CarouseWidget({Key? key, required this.carouselItems}) : super(key: key);

  @override
  State<CarouseWidget> createState() => _CarouseWidgetState();
}

class _CarouseWidgetState extends State<CarouseWidget> {
  CarouselController carouselController = CarouselController();
  var currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500.h,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: widget.carouselItems.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: widget.carouselItems[index].content,
                ),
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
              autoPlay: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              aspectRatio: 2.0,
              viewportFraction: 0.95,
              disableCenter: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Obx(
              () => AnimatedSmoothIndicator(
            activeIndex: currentIndex.value,
            count: widget.carouselItems.length,
            axisDirection: Axis.horizontal,
            effect: SlideEffect(
              spacing: 8.h,
              radius: 6.h,
              dotWidth: 20.h,
              dotHeight: 8.h,
              dotColor: Colors.grey.withOpacity(0.1),
              activeDotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

// Example Usage:
