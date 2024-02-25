import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../../../../../core/widgets/build_rich_text.dart';
import '../../../../../../core/widgets/build_text_next_to_text_button.dart';
import '../../../../../../core/widgets/fun_toast.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  bool isObscureText = true;

  var passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, AppRoutes.home);
          toastFun(txt: 'Login Successfully', state: ToastStates.SUCCESS);
        }
        if (state is FailureState) {
          toastFun(
              txt: 'Email Or Password Incorrect', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customRichText(
                              context: context,
                              textPartOne: 'Log ',
                              textPartTwo: 'In',
                            ),
                            verticalSpace(40),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Email')),
                            verticalSpace(10),
                            AppTextFormField(
                              hintText: 'example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              inputTextStyle: TextStyle(height: .6.h),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "should enter email";
                                } else if (!isEmailValid(value)) {
                                  return 'email must contain @ & .com';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Password')),
                            verticalSpace(10),
                            AppTextFormField(
                              hintText: '##########',
                              controller: passController,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              isObscureText: isObscureText,
                              inputTextStyle: TextStyle(height: .6.h),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "should enter password";
                                } else if (!isPasswordValid(value)) {
                                  return 'Password must include: 0-9, A-Z, a-z, and special characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(30),
                            AppTextButton(
                              buttonText: 'LOGIN',
                              backgroundColor: ColorsManager.mainColor,
                              buttonHeight: 44.h,
                              buttonWidth: 197.w,
                              textStyle: const TextStyle(
                                color: ColorsManager.white,
                              ),
                              onPressed: () {
                                // AuthCubit.get(context).userLogin(
                                //     email: emailController.text,
                                //     password: passController.text);
                                context.pushNamed(AppRoutes.home);
                              },
                            ),
                            customTextNextToTextButton(
                              context: context,
                              text: 'Create account?',
                              textButton: 'SignUp',
                              onPressed: () {
                                context.pushNamed(AppRoutes.signup);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
