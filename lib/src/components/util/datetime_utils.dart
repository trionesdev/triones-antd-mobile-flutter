import 'package:intl/intl.dart';

class DatetimeUtils {

  static String formatDatetime(DateTime? datetime) {
    if (datetime == null) {
      return "";
    }
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(datetime);
  }

  static String format(DateTime? datetime, String format) {
    if (datetime == null) {
      return "";
    }
    return DateFormat(format).format(datetime);
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
