import 'package:bloc/bloc.dart';
import 'package:charity/core/api/api_constant.dart';
import 'package:charity/ui/user/cubit/bloc_observer.dart';
import 'package:charity/ui/user/features/authentication/choise_screen/choise_screen.dart';
import 'package:charity/ui/user/features/home/screen/home_screen.dart';
import 'package:charity/ui/user/features/payment/logic/payment_keys.dart';
import 'package:charity/ui/user/features/support/screen/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'charity_app.dart';
import 'config/routes/app_router.dart';
import 'core/api/dio_helper.dart';
import 'core/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();

  String? token = CacheHelper.getBool(key: 'token');
  int? id = CacheHelper.getBool(key: 'id');
  ApiConstant.token = token;
  ApiConstant.id = id;
  print(ApiConstant.token);
  print(ApiConstant.id);

  runApp(CharityApp(
    initialWidget: token == null ? const ChoiseScreen() : const HomeScreen(),
    routes: AppRouter(),
  ));
}
