import 'package:intl/intl.dart';

String getDateString(DateTime date) {
  return DateFormat("yyyy年MM月dd日").format(date);
}

String getMonthString(DateTime date) {
  return DateFormat("MM月").format(date);
}
