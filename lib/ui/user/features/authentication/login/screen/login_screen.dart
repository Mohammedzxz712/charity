import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../../../../../core/widgets/build_rich_text.dart';
import '../../../../../../core/widgets/build_text_next_to_text_button.dart';
import '../../../../../../core/widgets/fun_toast.dart';
import '../../../../../../core/widgets/progress_indector.dart';
import '../logic/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        }
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, AppRoutes.home);
          toastFun(
              txt: AppLocalizations.of(context)!.loginsuccessfully,
              state: ToastStates.SUCCESS);
        }
        if (state is ForgetSuccessState) {
          Navigator.pushNamed(context, AppRoutes.forget);
          toastFun(
              txt: AppLocalizations.of(context)!.forgetsuccessfully,
              state: ToastStates.SUCCESS);
        }
        if (state is FailureState) {
          toastFun(
              txt: AppLocalizations.of(context)!.emailorpasswordincorrect,
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
              Form(
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
                            customRichText(
                              context: context,
                              textPartOne: AppLocalizations.of(context)!.log,
                              textPartTwo: AppLocalizations.of(context)!.ins,
                            ),
                            verticalSpace(40),
                            Align(
                                alignment: Alignment.topRight,
                                child:
                                    Text(AppLocalizations.of(context)!.email)),
                            verticalSpace(10),
                            AppTextFormField(
                              hintText: 'example@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              controller:
                                  context.read<LoginCubit>().emailController,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
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
                            verticalSpace(10),
                            Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                    AppLocalizations.of(context)!.password)),
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
                            verticalSpace(6),
                            Row(children: [
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  context.read<LoginCubit>().forgetPassword(
                                        email: context
                                            .read<LoginCubit>()
                                            .emailController
                                            .text,
                                      );
                                },
                                child:
                                    Text(AppLocalizations.of(context)!.forget,
                                        style: TextStyle(
                                          color: ColorsManager.semiGreen,
                                        )),
                              ),
                            ]),
                            AppTextButton(
                              buttonText: AppLocalizations.of(context)!.login,
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
                                  context.read<LoginCubit>().userLogin(
                                      email: context
                                          .read<LoginCubit>()
                                          .emailController
                                          .text,
                                      password: context
                                          .read<LoginCubit>()
                                          .passController
                                          .text);
                                }
                              },
                            ),
                            customTextNextToTextButton(
                              context: context,
                              text: AppLocalizations.of(context)!.createacoount,
                              textButton: AppLocalizations.of(context)!.signup,
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
