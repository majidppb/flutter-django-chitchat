part of 'chat_bloc.dart';

sealed class ChatEvent {
  const ChatEvent();
}

class GetChatEvent extends ChatEvent {
  const GetChatEvent();
}
