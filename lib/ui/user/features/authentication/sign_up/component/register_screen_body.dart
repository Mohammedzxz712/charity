import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/generated/assets.dart';
import 'package:charity/ui/user/features/authentication/login/logic/login_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          toastFun(
              txt: AppLocalizations.of(context)!.signupsuccessfully,
              state: ToastStates.SUCCESS);
        }
        if (state is FailureState) {
          toastFun(
              txt: AppLocalizations.of(context)!.emailorpasswordincorrect,
              state: ToastStates.ERROR);
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(40.h),
                            Align(
                              alignment: Alignment.center,
                              child: customRichText(
                                context: context,
                                textPartOne:
                                    AppLocalizations.of(context)!.sign1,
                                textPartTwo: AppLocalizations.of(context)!.up1,
                              ),
                            ),
                            verticalSpace(40.h),
                            Text(
                              AppLocalizations.of(context)!.fullname,
                            ),
                            AppTextFormField(
                              hintText: 'mohammed',
                              keyboardType: TextInputType.name,
                              controller:
                                  context.read<SignUpCubit>().nameController,
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 15.w),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .shouldenterusername;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10.h),
                            Text(AppLocalizations.of(context)!.email),
                            AppTextFormField(
                              hintText: 'example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  context.read<SignUpCubit>().emailController,
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 15.w),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.email;
                                } else if (!isEmailValid(value)) {
                                  return AppLocalizations.of(context)!
                                      .emailmustcontain;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10.h),
                            Text(AppLocalizations.of(context)!.password),
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
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 15.w),
                              isObscureText:
                                  context.read<SignUpCubit>().isObscureText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.password;
                                } else if (!isPasswordValid(value)) {
                                  return AppLocalizations.of(context)!
                                      .passwordmustinclude;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10.h),
                            Text(AppLocalizations.of(context)!.confirmpassword),
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
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 13.h, horizontal: 15.w),
                              isObscureText:
                                  context.read<SignUpCubit>().isObscureText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .confirmpassword;
                                } else if (context
                                        .read<SignUpCubit>()
                                        .confirmPassController
                                        .text !=
                                    context
                                        .read<SignUpCubit>()
                                        .passController
                                        .text) {
                                  return AppLocalizations.of(context)!
                                      .passworddoesnotmatch;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            verticalSpace(10.h),
                            Align(
                              alignment: Alignment.center,
                              child: AppTextButton(
                                buttonText:
                                    AppLocalizations.of(context)!.continues,
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
                            ),
                            verticalSpace(20.h),
                            customTextNextToTextButton(
                              context: context,
                              text: AppLocalizations.of(context)!
                                  .alreadyhaveaccount,
                              textButton: AppLocalizations.of(context)!.login,
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
