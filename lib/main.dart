import 'package:bloc/bloc.dart';
import 'package:charity/ui/user/cubit/bloc_observer.dart';
import 'package:charity/ui/user/features/payment/logic/payment_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'charity_app.dart';
import 'config/routes/app_router.dart';
import 'core/methods/get_current_location.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(CharityApp(routes: AppRouter()));
}
