part of 'all_messages_bloc.dart';

sealed class AllMessagesState extends Equatable {
  @override
  List<Object?> get props => [];

  const AllMessagesState();
}

class AllMessagesStateLoading extends AllMessagesState {
  const AllMessagesStateLoading();
}

class AllMessagesStateError extends AllMessagesState {
  const AllMessagesStateError();
}

class AllMessagesStateEmpty extends AllMessagesState {
  const AllMessagesStateEmpty();
}

class AllMessagesStateLoaded extends AllMessagesState {
  const AllMessagesStateLoaded({required this.contacts});

  final List<UserMessageProfile> contacts;

  @override
  List<Object?> get props => [contacts];
}
