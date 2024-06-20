part of '../chat.dart';

String getDay(DateTime dateTime) {
  final today = DateTime.now();
  if (today.day == dateTime.day &&
      today.month == dateTime.month &&
      today.year == dateTime.year) {
    return 'Today';
  } else {
    final yesterday = today.subtract(const Duration(days: 1));
    if (yesterday.day == dateTime.day &&
        yesterday.month == dateTime.month &&
        yesterday.year == dateTime.year) {
      return 'Yesterday';
    } else {
      return DateFormat.yMd().format(dateTime);
    }
  }
}
