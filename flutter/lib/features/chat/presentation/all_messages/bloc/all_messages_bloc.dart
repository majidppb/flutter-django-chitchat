import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../contacts/domain/entities/user.dart';
import '../../../domain/user_message_profile.dart';

part 'all_messages_event.dart';
part 'all_messages_state.dart';

class AllMessagesBloc extends Bloc<AllMessagesEvent, AllMessagesState> {
  AllMessagesBloc() : super(const AllMessagesStateLoading()) {
    on<AllMessagesEvent>((event, emit) async {
      emit(const AllMessagesStateLoading());

      // load

      emit(
        AllMessagesStateLoaded(
          contacts: List.generate(
            3,
            (index) => UserMessageProfile(
              user: User(
                id: index.toString(),
                name: 'Thomas',
                username: index.toString(),
                profilePicture: '',
              ),
              lastMessage: 'Haii',
              lastMessageDateTime: DateTime.now(),
            ),
          ),
        ),
      );
    });
  }
}
