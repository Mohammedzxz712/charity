import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../generated/assets.dart';
import '../logic/complete_signup_cubit.dart';
import '../../../../../../config/colors/app_colors.dart';

class CompleteSignUp extends StatelessWidget {
  final int userId;

  const CompleteSignUp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteSignupCubit, CompleteSignUpState>(
      listener: (context, state) {
        // Handle state changes if needed
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
                                  : const AssetImage('path/to/default/image')
                                      as ImageProvider,
                            ),
                            CircleAvatar(
                              radius: 20,
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
                        verticalSpace(10),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Phone'),
                        ),
                        AppTextFormField(
                          hintText: '01000000000',
                          keyboardType: TextInputType.phone,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "should enter phone";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Location'),
                        ),
                        AppTextFormField(
                          hintText: 'location',
                          keyboardType: TextInputType.text,
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.location_on_outlined,
                                size: 25),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "should enter location";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(25),
                        AppTextButton(
                          buttonText: 'SIGN UP',
                          backgroundColor: ColorsManager.mainColor,
                          buttonHeight: 44.h,
                          buttonWidth: 197.w,
                          textStyle:
                              const TextStyle(color: ColorsManager.white),
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.completeRegister(
                                location: cubit.locationController.text,
                                image: cubit.profilePhoto!,
                                userId: userId,
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
