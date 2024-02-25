import 'package:charity/config/routes/app_router.dart';
import 'package:charity/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharityApp extends StatelessWidget {
  AppRouter routes = AppRouter();
  CharityApp({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
    );
  }
}
