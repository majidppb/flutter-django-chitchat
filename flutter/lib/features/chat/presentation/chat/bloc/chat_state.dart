part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  @override
  List<Object> get props => [];

  const ChatState();
}

class ChatStateLoading extends ChatState {
  const ChatStateLoading();
}

class ChatStateError extends ChatState {
  const ChatStateError();
}

class ChatStateLoaded extends ChatState {
  const ChatStateLoaded({required this.messages});

  final List<Message> messages;

  @override
  List<Object> get props => [messages];
}
