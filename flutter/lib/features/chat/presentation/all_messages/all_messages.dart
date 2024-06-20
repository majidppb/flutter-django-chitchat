import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/app_styles.dart';
import '../../../../common/widgets/alert/alert.dart';
import '../../../../common/widgets/shimmer/shimmer.dart';
import 'bloc/all_messages_bloc.dart';

part 'utils/_get_day.dart';
part 'widgets/_loading.dart';

class AllMessagesScreen extends StatelessWidget {
  const AllMessagesScreen({super.key});

  static const path = '/message';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AllMessagesBloc()..add(const AllMessagesEvent()),
      child: const _AllMessagesScreen(),
    );
  }
}

class _AllMessagesScreen extends StatelessWidget {
  const _AllMessagesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Messages')),
      body: BlocBuilder<AllMessagesBloc, AllMessagesState>(
        builder: (context, state) {
          if (state is AllMessagesStateLoading) {
            return const _LoadingWidget();
          }

          if (state is AllMessagesStateError) {
            return AppStyles.nullWidget; //TODO
          }

          if (state is AllMessagesStateEmpty) {
            return AlertPage(
              animation: 'assets/images/no-messages.gif',
              description:
                  'Oops, no messages here.\nFeel free to start a conversation!',
              buttonLabel: 'OK',
              onPressed: context.pop,
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final item = state.contacts[index];
              return ListTile(
                leading: const CircleAvatar(),
                onTap: () => context.push(
                  '${AllMessagesScreen.path}/${item.user.username}',
                  extra: item.user,
                ),
                title: Text(item.user.name),
                subtitle: Text(item.lastMessage),
                trailing: Text(getDay(item.lastMessageDateTime)),
              );
            },
            separatorBuilder: (_, __) => AppStyles.height10,
            itemCount: (state as AllMessagesStateLoaded).contacts.length,
          );
        },
      ),
    );
  }
}
