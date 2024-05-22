import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/generated/assets.dart';
import 'package:charity/ui/user/features/authentication/login/logic/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/build_rich_text.dart';
import '../../../../../../core/widgets/build_text_next_to_text_button.dart';
import '../../../../../../core/widgets/fun_toast.dart';
import '../../../../../../core/widgets/progress_indector.dart';
import '../../complete_signup/screen/complete_signup.dart';
import '../logic/sign_up_cubit.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is LoadingSignUpState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        }
        if (state is SuccessRegisterState) {
          Navigator.pushNamed(context, AppRoutes.completeRegister);
          toastFun(txt: 'Sign Up Successfully', state: ToastStates.SUCCESS);
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
                key: context.read<SignUpCubit>().formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: AppConstant.deviceHeight(context),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpace(40),
                            customRichText(
                              context: context,
                              textPartOne: 'Sign ',
                              textPartTwo: 'UP',
                            ),
                            verticalSpace(40),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Full Name',
                              ),
                            ),
                            AppTextFormField(
                              hintText: 'mohammed',
                              keyboardType: TextInputType.name,
                              controller:
                                  context.read<SignUpCubit>().nameController,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "should enter username";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Email')),
                            AppTextFormField(
                              hintText: 'example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  context.read<SignUpCubit>().emailController,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
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
                            AppTextFormField(
                              hintText: '##########',
                              controller:
                                  context.read<SignUpCubit>().passController,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    context.read<SignUpCubit>().isObscureText =
                                        !(context
                                            .read<SignUpCubit>()
                                            .isObscureText);
                                  });
                                },
                                child: Icon(
                                  context.read<SignUpCubit>().isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                              isObscureText:
                                  context.read<SignUpCubit>().isObscureText,
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
                            verticalSpace(10),
                            const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Confirm Password')),
                            AppTextFormField(
                              hintText: '##########',
                              controller: context
                                  .read<SignUpCubit>()
                                  .confirmPassController,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    context.read<SignUpCubit>().isObscureText =
                                        !(context
                                            .read<SignUpCubit>()
                                            .isObscureText);
                                  });
                                },
                                child: Icon(
                                  context.read<SignUpCubit>().isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                              isObscureText:
                                  context.read<SignUpCubit>().isObscureText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "should enter confirm password";
                                } else if (context
                                        .read<SignUpCubit>()
                                        .confirmPassController
                                        .text !=
                                    context
                                        .read<SignUpCubit>()
                                        .passController
                                        .text) {
                                  return 'Password does not match';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10),
                            AppTextButton(
                              buttonText: 'Continue',
                              backgroundColor: ColorsManager.mainColor,
                              buttonHeight: 44.h,
                              buttonWidth: 197.w,
                              textStyle: const TextStyle(
                                color: ColorsManager.white,
                              ),
                              onPressed: () {
                                if (context
                                    .read<SignUpCubit>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context.read<SignUpCubit>().userRegister(
                                        email: context
                                            .read<SignUpCubit>()
                                            .emailController
                                            .text,
                                        password: context
                                            .read<SignUpCubit>()
                                            .passController
                                            .text,
                                        name: context
                                            .read<SignUpCubit>()
                                            .nameController
                                            .text,
                                      );
                                }
                              },
                            ),
                            verticalSpace(20),
                            customTextNextToTextButton(
                              context: context,
                              text: 'Already have account?',
                              textButton: 'Login',
                              onPressed: () {
                                context.pushNamed(AppRoutes.login);
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
