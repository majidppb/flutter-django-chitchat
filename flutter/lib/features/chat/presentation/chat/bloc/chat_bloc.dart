import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../contacts/domain/entities/user.dart';
import '../../../domain/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final User user;

  ChatBloc(@factoryParam this.user) : super(const ChatStateLoading()) {
    on<GetChatEvent>(_onGetChat);
  }

  Future<void> _onGetChat(GetChatEvent event, Emitter<ChatState> emit) async {
    emit(const ChatStateLoading());

    // get chat

    emit(
      ChatStateLoaded(
        messages: [
          Message(
            id: '1',
            message: 'Thank you',
            dateTime: DateTime.now().subtract(const Duration(days: 2)),
            status: MessageStatus.seen,
          ),
          Message(
            id: '1',
            message: 'lskfdglsjkfdgjlskjfgl;sjgsjlg slj;lfdj;ajf;sf',
            dateTime: DateTime.now().subtract(const Duration(days: 2)),
            status: null,
          ),
          Message(
            id: '1',
            message: 'Hello',
            dateTime: DateTime.now().subtract(const Duration(days: 2)),
            status: MessageStatus.delivered,
          ),
          Message(
            id: '1',
            message: 'Hello, Thank you',
            dateTime: DateTime.now().subtract(const Duration(days: 1)),
            status: null,
          ),
          Message(
            id: '1',
            message: 'Hello, asdkljhsdflakhldfajkhjhsf',
            dateTime: DateTime.now().subtract(const Duration(days: 1)),
            status: MessageStatus.sent,
          ),
          Message(
            id: '1',
            message: 'jal;fds;kalsd;fakj;sdfja;sjkdfahfl;ksfahf',
            dateTime: DateTime.now().subtract(const Duration(days: 1)),
            status: null,
          ),
          Message(
            id: '1',
            message: 'lakj;ds;js;fja;ksdjf;alksjdf;a',
            dateTime: DateTime.now(),
            status: null,
          ),
          Message(
            id: '1',
            message: 'l;kajsdlfka;lksjsdfaksdfjka;slfdja;js',
            dateTime: DateTime.now(),
            status: null,
          ),
          Message(
            id: '1',
            message: 'Thank you so much',
            dateTime: DateTime.now(),
            status: MessageStatus.sending,
          ),
        ],
      ),
    );
  }
}
