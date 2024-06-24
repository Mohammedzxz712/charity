import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../config/style/icon_broken.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/progress_indector.dart';
import '../logic/ediet_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameAndPhoneAndLocation extends StatelessWidget {
  const NameAndPhoneAndLocation({
    super.key,
    required this.cubit,
  });

  final EdietCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EdietCubit, EdietState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(10.h),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55.r,
                    backgroundImage: cubit.profilePhoto != null
                        ? FileImage(cubit.profilePhoto!) as ImageProvider
                        : NetworkImage(
                        'https://charityorg.life/storage/app/${cubit.GetProfileModel!.image}'),
                  ),
                  InkWell(
                    onTap: () {
                      cubit.getProfileImage();
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: ColorsManager.black,
                      child: Icon(Icons.camera_alt_outlined,
                          color: ColorsManager.white),
                    ),
                  )
                ],
              ),
              verticalSpace(60.h),
              AppTextFormField(
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(
                  IconBroken.Profile,
                  color: Colors.black,
                ),
                hintText: AppLocalizations.of(context)!.name,
                controller: cubit.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name must be required';
                  }
                  return null;
                },
              ),
              verticalSpace(12.h),
              AppTextFormField(
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  IconBroken.Message,
                  color: Colors.black,
                ),
                hintText: AppLocalizations.of(context)!.email,
                controller: cubit.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.emailmustcontain;
                  }
                  return null;
                },
              ),
              verticalSpace(12.h),
              AppTextFormField(
                keyboardType: TextInputType.streetAddress,
                prefixIcon: const Icon(
                  IconBroken.Location,
                  color: Colors.black,
                ),
                hintText: AppLocalizations.of(context)!.location,
                controller: cubit.locationController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.locationmustberequired;
                  }
                  return null;
                },
              ),
              verticalSpace(12.h),
              AppTextFormField(
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(
                  IconBroken.Call,
                  color: Colors.black,
                ),
                hintText: AppLocalizations.of(context)!.phone,
                controller: cubit.phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.phonemustberequired;
                  }
                  return null;
                },
              ),
              verticalSpace(60.h),
              state is LoadingUpdateState
                  ? const Center(child: CustomLoadingIndicator())
                  : AppTextButton(
                textStyle: TextStyle(
                  backgroundColor: Colors.black
                      ,color: Colors.white,
                  fontSize: 14.sp
                ),
                buttonText: AppLocalizations.of(context)!.update,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.updateUserData(
                      cubit.nameController.text,
                      cubit.emailController.text,
                      cubit.phoneController.text,
                      cubit.locationController.text,
                      cubit.profilePhoto,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
