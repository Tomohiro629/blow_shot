import 'package:intl/intl.dart';

String getDateString(DateTime date) {
  return DateFormat("yyyy年MM月dd日").format(date);
}

String getYearString(DateTime date) {
  return DateFormat("yyyy").format(date);
}

String getMonthString(DateTime date) {
  return DateFormat("MM").format(date);
}

String getDayString(DateTime date) {
  return DateFormat("dd").format(date);
}
