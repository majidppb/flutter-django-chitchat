part of '../all_messages.dart';

String getDay(DateTime dateTime) {
  final difference = DateTime.now().difference(dateTime);
  if (difference < const Duration(days: 1)) {
    return DateFormat.jm().format(dateTime);
  } else if (difference < const Duration(days: 2)) {
    return 'Yesterday';
  } else {
    return DateFormat.yMd().format(dateTime);
  }
}
