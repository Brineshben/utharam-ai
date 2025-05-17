import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String brandName;
  final String frequency;
  final String dosage;
  final String date;

  const MedicineCard({
    Key? key,
    required this.brandName,
    required this.frequency,
    required this.dosage, required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              brandName ,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.timeline_sharp, size: 15, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Frequency: $frequency',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.medical_services, size: 15, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Dosage: $dosage',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),

            Row(
              children: [
                Icon(Icons.access_time_rounded, size: 15, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Date: $date',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}