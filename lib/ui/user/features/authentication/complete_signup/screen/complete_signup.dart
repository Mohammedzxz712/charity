import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/fun_toast.dart';
import '../../../../../../core/widgets/progress_indector.dart';
import '../../../../../../generated/assets.dart';
import '../../../ediet_profile/logic/ediet_cubit.dart';
import '../logic/complete_signup_cubit.dart';
import '../../../../../../config/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteSignUp extends StatelessWidget {
  final int userId;

  const CompleteSignUp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteSignupCubit, CompleteSignUpState>(
      listener: (context, state) {
        if (state is CompleteSignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CustomLoadingIndicator(),
            ),
          );
        }
        if (state is CompleteSignUpSuccess) {
          Navigator.pushNamed(context, AppRoutes.home);
          toastFun(
              txt: AppLocalizations.of(context)!.signupsuccessfully,
              state: ToastStates.SUCCESS);
        }
        if (state is CompleteSignUpFailure) {
          toastFun(txt: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        var cubit = context.read<CompleteSignupCubit>();
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              const Image(
                image: AssetImage(Assets.imagesFirist),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: cubit.profilePhoto != null
                                  ? FileImage(cubit.profilePhoto!)
                                  : const AssetImage(Assets.imagesImg)
                                      as ImageProvider,
                            ),
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: ColorsManager.mainColor,
                              child: IconButton(
                                icon: const Icon(Icons.camera_alt_outlined,
                                    color: ColorsManager.white),
                                onPressed: () {
                                  cubit.getProfileImage();
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(AppLocalizations.of(context)!.phone),
                        ),
                        verticalSpace(10.h),
                        AppTextFormField(
                          hintText: '01000000000',
                          controller: cubit.phoneController,
                          keyboardType: TextInputType.phone,
                          contentPadding:  EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 15.w),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .pleaseenteraphonenumber;
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(AppLocalizations.of(context)!.location),
                        ),
                        verticalSpace(10.h),
                        AppTextFormField(
                          hintText: AppLocalizations.of(context)!.location,
                          keyboardType: TextInputType.text,
                          controller: cubit.locationController,
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.location_on_outlined,
                                size: 25),
                          ),
                          contentPadding:  EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 15.w),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .pleaseenteralocation;
                            }
                            return null;
                          },
                        ),
                        verticalSpace(25.h),
                        AppTextButton(
                          buttonText: AppLocalizations.of(context)!.signup,
                          backgroundColor: ColorsManager.mainColor,
                          buttonHeight: 44.h,
                          buttonWidth: 197.w,
                          textStyle:
                              const TextStyle(color: ColorsManager.white),
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.completeSignUp(
                                cubit.phoneController.text,
                                cubit.locationController.text,
                                cubit.profilePhoto,
                              );
                            }
                          },
                        ),
                      ],
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
