import 'package:charity/config/routes/router.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../components/login/login_elevated.dart';
import '../../components/common/build_rich_text.dart';
import '../../components/common/build_text_next_to_text_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(Assets.imagesFirist),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customRichText(
                          context: context,
                          textPartOne: 'Log ',
                          textPartTwo: 'In',
                        ),
                        const Gap(30),
                        const Gap(10),
                        const Align(
                            alignment: Alignment.topLeft, child: Text('Email')),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                            isPassword: false,
                            maxLine: 1,
                            hint: 'example@gmail.com',
                            fillColor: Colors.white,
                            filled: true,
                            controller: emailController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "should enter email";
                              } else if (!isEmailValid(value)) {
                                return 'email must contain @ & .com';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Password')),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                            isPassword: false,
                            maxLine: 1,
                            hint: '****************',
                            fillColor: Colors.white,
                            filled: true,
                            controller: passController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "should enter password";
                              } else if (!isPasswordValid(value)) {
                                return 'Password must include: 0-9, A-Z, a-z, and special characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        const Gap(30),
                        SizedBox(
                          width: 197,
                          height: 44,
                          child: LoginElevated(
                            onPress: () {
                              Navigator.pushNamed(context, AppRoutes.home);
                            },
                          ),
                        ),
                        customTextNextToTextButton(
                          context: context,
                          text: 'Create account?',
                          textButton: 'SignUp',
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
