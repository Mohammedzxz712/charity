import 'package:flutter/material.dart';

import '../../components/register/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'reg';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterScreenBody(),
    );
  }
}
