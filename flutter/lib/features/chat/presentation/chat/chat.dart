import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../../../contacts/domain/entities/user.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/app_styles.dart';
import '../../../../core/di/injectable.dart';
import '../../domain/message.dart';
import 'bloc/chat_bloc.dart';

part 'widgets/_chat_field.dart';
part 'widgets/_conversation.dart';
part 'widgets/_sent_message.dart';
part 'widgets/_received_message.dart';
part 'utils/_get_day.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required User user}) : _user = user;

  static const path = ':username';

  final User _user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<ChatBloc>(param1: _user),
      child: const _ChatScreen(),
    );
  }
}

class _ChatScreen extends StatelessWidget {
  const _ChatScreen();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatBloc>().add(const GetChatEvent());
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(),
            AppStyles.width10,
            Text(context.read<ChatBloc>().user.name),
          ],
        ),
      ),
      body: const SafeArea(
        top: false,
        minimum: AppStyles.hPadding8,
        child: Column(
          children: [
            _ConversationWidget(),
            _ChatFieldWidget(),
          ],
        ),
      ),
    );
  }
}
