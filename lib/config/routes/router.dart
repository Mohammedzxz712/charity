import 'package:charity/ediet_profile_screen.dart';
import 'package:charity/ui/user/features/about/screen/about_us.dart';
import 'package:charity/ui/user/features/authentication/screens/choise_screen/choise_screen.dart';
import 'package:charity/ui/user/features/authentication/screens/login_screen/login_screen.dart';
import 'package:charity/ui/user/features/authentication/screens/register_screen/register_screen.dart';
import 'package:charity/ui/user/features/home/screen/home_screen.dart';
import 'package:charity/ui/user/features/payment/screen/payment.dart';
import 'package:charity/ui/user/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/user/features/org_method/screens/org_method.dart';

class AppRoutes {
  static const String splash = '/';
  static const String choiceScreen = 'ChoiceScreen';
  static const String login = 'LoginScreen';
  static const String signup = 'RegisterScreen';
  static const String home = 'HomeScreen';
  static const String about = 'AboutScreen';
  static const String payment = 'PaymentScreen';
  static const String organizationMethod = 'OrganizationMethod';
  static const String profile = 'Profile';
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (context) => PaymentScreen(),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case AppRoutes.organizationMethod:
        return MaterialPageRoute(
          builder: (context) => OrganizationMethod(),
        );
      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => const AboutUs(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case AppRoutes.choiceScreen:
        return MaterialPageRoute(
          builder: (context) => ChoiseScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: unDefineRoute(),
          ),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Center(
      child: Text('Not Find Page'),
    );
  }
}
