import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.username,
      required this.name,
      required this.profilePicture});

  final String id;
  final String username;
  final String name;
  final String profilePicture;

  @override
  List<Object?> get props => [id, name, profilePicture];
}
