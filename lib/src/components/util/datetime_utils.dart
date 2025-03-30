class DatetimeUtils {

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
