import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/contacts/domain/entities/user.dart';
import '../../features/chat/presentation/chat/chat.dart';
import '../../features/chat/presentation/all_messages/all_messages.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AllMessagesScreen.path,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AllMessagesScreen.path,
      pageBuilder: (context, state) =>
          _getPage(state, const AllMessagesScreen()),
      routes: [
        GoRoute(
          path: ChatScreen.path,
          pageBuilder: (context, state) {
            print('Called');
            return _getPage(state, ChatScreen(user: state.extra as User));
          },
        ),
      ],
    ),
  ],
);

MaterialPage _getPage(GoRouterState state, Widget child) => MaterialPage(
      key: state.pageKey,
      child: child,
    );
