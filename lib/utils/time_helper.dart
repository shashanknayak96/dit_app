class TimeHelper {
  isPastMidnight<bool>() {
    var timeNow = DateTime.now();
    var timeToMidnight = DateTime(timeNow.year, timeNow.month, timeNow.day)
        .add(const Duration(days: 1));
  }
}
