import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.id,
    required this.message,
    required this.dateTime,
    this.status,
  });

  final DateTime dateTime;
  final String id;
  final MessageStatus? status;
  final String message;

  @override
  List<Object?> get props => [id, status];
}

enum MessageStatus { sending, sent, delivered, seen }
