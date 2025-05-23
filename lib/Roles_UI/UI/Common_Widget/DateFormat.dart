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