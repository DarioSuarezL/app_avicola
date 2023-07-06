import 'package:app_avicola/config/router/app_router.dart';
import 'package:app_avicola/config/theme/app_theme.dart';
import 'package:app_avicola/presentation/providers/sheds_provider.dart';
import 'package:app_avicola/presentation/providers/user_provider.dart';
import 'package:app_avicola/presentation/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => ShedsProvider()),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColorIndex: 1).getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}