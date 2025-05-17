import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showDot;

  const RecentActivityTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.showDot = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot indicator
        if (showDot)
          const SizedBox(width: 6),
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        const SizedBox(width: 6),
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.h,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
