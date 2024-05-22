import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/build_rich_text.dart';
import '../../../../../../core/widgets/build_text_next_to_text_button.dart';
import '../../../../../../core/widgets/fun_toast.dart';
import '../../../../../../core/widgets/progress_indector.dart';
import '../../../../../../generated/assets.dart';
import '../logic/login_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoadingState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }
          if (state is ResetSuccessState) {
            Navigator.pushNamed(context, AppRoutes.login);
            toastFun(txt: 'Reset Successfully', state: ToastStates.SUCCESS);
          }

          if (state is FailureState) {
            toastFun(txt: 'Try Again', state: ToastStates.ERROR);
            Navigator.pop(context);
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
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: LoginCubit.get(context).formKey,
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
                                  textPartOne: 'Reset ',
                                  textPartTwo: 'Password',
                                ),
                                verticalSpace(40),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Email')),
                                verticalSpace(10),
                                AppTextFormField(
                                  hintText: 'example@gmail.com',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: context
                                      .read<LoginCubit>()
                                      .emailController,
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
                                verticalSpace(10),
                                AppTextFormField(
                                  hintText: '***********',
                                  controller:
                                      context.read<LoginCubit>().passController,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 15),
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
                                verticalSpace(6),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Otp')),
                                verticalSpace(6),
                                AppTextFormField(
                                  hintText: '******',
                                  controller:
                                      context.read<LoginCubit>().otpController,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 15),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "should enter otp";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                verticalSpace(16),
                                AppTextButton(
                                  buttonText: 'RESET',
                                  backgroundColor: ColorsManager.mainColor,
                                  buttonHeight: 44.h,
                                  buttonWidth: 197.w,
                                  textStyle: const TextStyle(
                                    color: ColorsManager.white,
                                  ),
                                  onPressed: () {
                                    if (context
                                        .read<LoginCubit>()
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      LoginCubit.get(context).resetPassword(
                                        email: context
                                            .read<LoginCubit>()
                                            .emailController
                                            .text
                                            .trim(),
                                        password: context
                                            .read<LoginCubit>()
                                            .passController
                                            .text
                                            .trim(),
                                        otp: context
                                            .read<LoginCubit>()
                                            .otpController
                                            .text
                                            .trim(),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // child: Form(
                  //   key: context.read<LoginCubit>().formKey,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //
                  //       TextFormField(
                  //         controller: LoginCubit.get(context).emailController,
                  //         decoration: const InputDecoration(labelText: 'Email'),
                  //         keyboardType: TextInputType.emailAddress,
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter your email';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(height: 16.0),
                  //       TextFormField(
                  //         controller: LoginCubit.get(context).otpController,
                  //         decoration: const InputDecoration(labelText: 'OTP'),
                  //         keyboardType: TextInputType.number,
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter the OTP';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(height: 16.0),
                  //       TextFormField(
                  //         controller: LoginCubit.get(context).passController,
                  //         decoration:
                  //             InputDecoration(labelText: 'New Password'),
                  //         obscureText: true,
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter a new password';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       const SizedBox(height: 32.0),
                  //       Center(
                  //         child: AppTextButton(
                  //           buttonText: 'Submit',
                  //           backgroundColor: ColorsManager.mainColor,
                  //           buttonHeight: 44.h,
                  //           buttonWidth: 197.w,
                  //           textStyle: const TextStyle(
                  //             color: ColorsManager.white,
                  //           ),
                  //           onPressed: () {
                  //             if (context
                  //                 .read<LoginCubit>()
                  //                 .formKey
                  //                 .currentState!
                  //                 .validate()) {
                  //               LoginCubit.get(context).resetPassword(
                  //                 email: context
                  //                     .read<LoginCubit>()
                  //                     .emailController
                  //                     .text
                  //                     .trim(),
                  //                 password: context
                  //                     .read<LoginCubit>()
                  //                     .passController
                  //                     .text
                  //                     .trim(),
                  //                 otp: context
                  //                     .read<LoginCubit>()
                  //                     .otpController
                  //                     .text
                  //                     .trim(),
                  //               );
                  //             }
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
