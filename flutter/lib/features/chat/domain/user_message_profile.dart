import 'package:equatable/equatable.dart';

import '../../contacts/domain/entities/user.dart';

class UserMessageProfile extends Equatable {
  final User user;
  final String lastMessage;
  final DateTime lastMessageDateTime;

  const UserMessageProfile(
      {required this.user,
      required this.lastMessage,
      required this.lastMessageDateTime});

  @override
  List<Object?> get props => [user, lastMessage, lastMessageDateTime];
}
