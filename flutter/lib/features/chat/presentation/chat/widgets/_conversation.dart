part of '../chat.dart';

class _ConversationWidget extends StatefulWidget {
  const _ConversationWidget();

  @override
  State<_ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<_ConversationWidget> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatStateLoaded) {
              // Map [state.chats] to List<Widget>

              final chatItems = <Widget>[];

              for (int i = 0; i < state.messages.length; i++) {
                final message = state.messages[i];
                final prevMsgDateTime =
                    i == 0 ? null : state.messages[i - 1].dateTime;

                if (i == 0 ||
                    message.dateTime.day != prevMsgDateTime!.day ||
                    message.dateTime.month != prevMsgDateTime.month ||
                    message.dateTime.year != prevMsgDateTime.year) {
                  chatItems.add(
                    Center(
                      child: Text(getDay(message.dateTime)),
                    ),
                  );
                }
                chatItems.add(message.status == null
                    ? _ReceivedMessageWidget(message)
                    : _SentMessageWidget(message));
              }

              // Display Chats

              final start = chatItems.length - 1;

              return ListView.separated(
                reverse: true,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (_, index) => chatItems[start - index],
                separatorBuilder: (_, __) => AppStyles.height10,
                itemCount: chatItems.length,
              );
            }

            return AppStyles.nullWidget; //TODO
          },
        ),
      ),
    );
  }
}
