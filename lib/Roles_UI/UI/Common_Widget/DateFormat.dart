import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String? isoDateString) {
  if (isoDateString == null || isoDateString.isEmpty) return "";

  try {
    DateTime dateTime = DateTime.parse(isoDateString).toLocal(); // Convert to local time if needed
    final formattedDate = DateFormat("dd-MM-yyyy [hh:mm a]").format(dateTime);
    return formattedDate;
  } catch (e) {
    return "";
  }
}
String getSeverityLevel(String value) {
  switch (value) {
    case '1':
      return 'low';
    case '2':
      return 'mild';
    case '3':
      return 'high';
    case '4':
      return 'severe';
    case '5':
      return 'critical';
    default:
      return '----'; // for unexpected string values
  }
}
Color getSeverityColor(String severity) {
  switch (severity) {
    case '1':
      return Colors.green; // Low severity
    case '2':
      return Colors.green.shade800; // Dark green for mild
    case '3':
      return Colors.yellow; // High
    case '4':
      return Colors.orange; // Severe
    case '5':
      return Colors.red; // Critical
    default:
      return Colors.grey; // Unknown / default
  }
}
String convertDateFormat(String date) {
  try {
    final parts = date.split('-');
    if (parts.length != 3) return 'Invalid date format';
    final yyyy = parts[0];
    final mm = parts[1];
    final dd = parts[2];
    return '$dd-$mm-$yyyy';
  } catch (e) {
    return 'Error: ${e.toString()}';
  }
}