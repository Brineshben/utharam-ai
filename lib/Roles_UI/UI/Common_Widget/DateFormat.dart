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