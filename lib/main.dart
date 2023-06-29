import 'package:app_avicola/config/router/app_router.dart';
import 'package:app_avicola/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColorIndex: 1).getTheme(),
      routerConfig: appRouter,
    );
  }
}