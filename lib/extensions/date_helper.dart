
import 'package:intl/intl.dart';

class DateHelper {
  static String getDayFormat(String dateString) {
    final date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(date);
  }

  static String getDayCourseFormat(String dateString) {
    final date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('MM/yyyy');
    return formatter.format(date);
  }

  static String getDayBornFormat(DateTime date1) {
    String dateString = date1.toIso8601String();
    final date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd.MM.yy');
    return formatter.format(date);
  }

}