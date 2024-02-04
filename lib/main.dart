import 'package:bloc/bloc.dart';
import 'package:charity/config/routes/router.dart';
import 'package:charity/config/themes/themes.dart';
import 'package:charity/ui/user/cubit/bloc_observer.dart';
import 'package:charity/ui/user/features/payment/controller/payment_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil
    ScreenUtil.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: (settings) => Routes.onGenerate(settings),
    );
  }
}
