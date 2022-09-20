class TimeHelper {
  static DateTime getMidnightTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day)
        .add(const Duration(days: 1));
  }
}
