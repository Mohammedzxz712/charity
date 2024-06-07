import 'package:charity/config/routes/app_router.dart';
import 'package:charity/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharityApp extends StatelessWidget {
  final Widget initialWidget;
  final AppRouter routes;

  CharityApp({super.key, required this.initialWidget, required this.routes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(375, 812), // Adjust this to match your design dimensions
      builder: (context, child) {
        return MaterialApp(
          locale: Locale('ar'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          themeMode: ThemeMode.light,
          home: initialWidget,
          onGenerateRoute: AppRouter.onGenerate,
        );
      },
    );
  }
}
