import 'package:flutter/material.dart';

import 'common/utils/app_theme.dart';
import 'core/router/router.dart';
import 'core/di/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chit Chat',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'root',
      routerConfig: router,
    );
  }
}
