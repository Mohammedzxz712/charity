import 'package:charity/config/routes/routes.dart';
import 'package:charity/ui/user/features/authentication/complete_signup/logic/complete_signup_cubit.dart';
import 'package:charity/ui/user/features/authentication/login/logic/login_cubit.dart';
import 'package:charity/ui/user/features/authentication/sign_up/logic/sign_up_cubit.dart';
import 'package:charity/ui/user/features/categories/logic/categories_cubit.dart';
import 'package:charity/ui/user/features/ediet_profile/logic/ediet_cubit.dart';
import 'package:charity/ui/user/features/ediet_profile/screen/ediet_profile_screen.dart';
import 'package:charity/ui/user/features/about/screen/about_us.dart';
import 'package:charity/ui/user/features/authentication/login/screen/login_screen.dart';
import 'package:charity/ui/user/features/authentication/sign_up/screen/register_screen.dart';
import 'package:charity/ui/user/features/home/screen/home_screen.dart';
import 'package:charity/ui/user/features/one_organization/screens/organization_desc.dart';
import 'package:charity/ui/user/features/payment/screen/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/user/features/authentication/choise_screen/choise_screen.dart';
import '../../ui/user/features/authentication/complete_signup/screen/complete_signup.dart';
import '../../ui/user/features/authentication/login/screen/forget_password.dart';
import '../../ui/user/features/categories/screens/categories_screen.dart';
import '../../ui/user/features/home/logic/cubit.dart';
import '../../ui/user/features/support/screen/help_center_screen.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );
      case AppRoutes.support:
        return MaterialPageRoute(
          builder: (context) => const HelpAndSupportScreen(),
        );

      case AppRoutes.completeRegister:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CompleteSignupCubit(),
            child: CompleteSignUp(
              userId: 1,
            ),
          ),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => EdietCubit()..getUserData(),
            child: ProfileScreen(),
          ),
        );
      case AppRoutes.organizationMethod:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const OrganizationMethod(
              organizationId: 3,
            ),
          ),
        );
      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => const AboutUs(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit()..getHomeData(),
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
      case AppRoutes.organizationDesc:
        return MaterialPageRoute(
          builder: (context) => OrganizationDetailScreen(
            organizationId: 3,
          ),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.forget:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
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
