extension DateTimeExtension on DateTime {
  String toDateOnlyText() {
    final dayString = day.toString().padLeft(2, '0');
    final monthString = month.toString().padLeft(2, '0');
    final yearString = year.toString();
    return "$dayString/$monthString/$yearString";
  }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}
