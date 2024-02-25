import 'package:charity/config/routes/routes.dart';
import 'package:charity/ui/user/features/authentication/login/logic/login_cubit.dart';
import 'package:charity/ui/user/features/authentication/sign_up/logic/sign_up_cubit.dart';
import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:charity/ui/user/features/ediet_profile/screen/ediet_profile_screen.dart';
import 'package:charity/ui/user/features/about/screen/about_us.dart';
import 'package:charity/ui/user/features/authentication/login/screen/login_screen.dart';
import 'package:charity/ui/user/features/authentication/sign_up/screen/register_screen.dart';
import 'package:charity/ui/user/features/home/screen/home_screen.dart';
import 'package:charity/ui/user/features/payment/screen/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/user/features/authentication/choise_screen/choise_screen.dart';
import '../../ui/user/features/categories/screens/categories_screen.dart';
import '../../ui/user/features/home/logic/cubit.dart';
import '../../ui/user/features/support/screen/help_center_screen.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (context) => PaymentScreen(),
        );
      case AppRoutes.support:
        return MaterialPageRoute(
          builder: (context) => const HelpAndSupportScreen(),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case AppRoutes.organizationMethod:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const OrganizationMethod(),
          ),
        );
      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => const AboutUs(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.choiceScreen:
        return MaterialPageRoute(
          builder: (context) => const ChoiseScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page Not Found'),
        ),
      );
    });
  }
}
