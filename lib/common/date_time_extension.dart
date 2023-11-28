import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateOnlyText() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}
