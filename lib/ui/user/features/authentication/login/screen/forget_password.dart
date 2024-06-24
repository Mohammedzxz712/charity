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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            toastFun(
                txt: AppLocalizations.of(context)!.forgetsuccessfully,
                state: ToastStates.SUCCESS);
          }

          if (state is FailureState) {
            toastFun(
                txt: AppLocalizations.of(context)!.tryagain,
                state: ToastStates.ERROR);
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
                                verticalSpace(40.h),
                                customRichText(
                                  context: context,
                                  textPartOne:
                                      AppLocalizations.of(context)!.reset1,
                                  textPartTwo:
                                      AppLocalizations.of(context)!.password,
                                ),
                                verticalSpace(40.h),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        AppLocalizations.of(context)!.email)),
                                verticalSpace(10.h),
                                AppTextFormField(
                                  hintText: 'example@gmail.com',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: context
                                      .read<LoginCubit>()
                                      .emailController,
                                  contentPadding:  EdgeInsets.symmetric(
                                      vertical: 13.h, horizontal: 15.w),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .shouldenteremail;
                                    } else if (!isEmailValid(value)) {
                                      return AppLocalizations.of(context)!
                                          .emailmustcontain;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                verticalSpace(10.h),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(AppLocalizations.of(context)!
                                        .password)),
                                verticalSpace(10.h),
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
                                  contentPadding:  EdgeInsets.symmetric(
                                      vertical: 13.h, horizontal: 15.w),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .shouldenterpassword;
                                    } else if (!isPasswordValid(value)) {
                                      return AppLocalizations.of(context)!
                                          .passwordmustinclude;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                verticalSpace(6.h),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        AppLocalizations.of(context)!.otp)),
                                verticalSpace(6.h),
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
                                  contentPadding:  EdgeInsets.symmetric(
                                      vertical: 13.h, horizontal: 15.w),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .shouldenterotp;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                verticalSpace(16.h),
                                AppTextButton(
                                  buttonText:
                                      AppLocalizations.of(context)!.reset,
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
