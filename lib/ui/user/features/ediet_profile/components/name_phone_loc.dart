import 'package:flutter/material.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../config/style/icon_broken.dart';
import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../logic/ediet_cubit.dart';

class NameAndPhoneAndLocation extends StatelessWidget {
  const NameAndPhoneAndLocation({
    super.key,
    required this.cubit,
  });

  final EdietCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(10),
        const Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(''),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: ColorsManager.black,
              child:
                  Icon(Icons.camera_alt_outlined, color: ColorsManager.white),
            )
          ],
        ),
        verticalSpace(60),
        AppTextFormField(
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(
            IconBroken.Profile,
            color: Colors.black,
          ),
          hintText: 'Name',
          controller: cubit.nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Name must be required';
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(
            IconBroken.Message,
            color: Colors.black,
          ),
          hintText: 'Email',
          controller: cubit.emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Email must be required';
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          keyboardType: TextInputType.streetAddress,
          prefixIcon: const Icon(
            IconBroken.Location,
            color: Colors.black,
          ),
          hintText: 'Location',
          controller: cubit.locationController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'location must be required';
            }
            return null;
          },
        ),
        verticalSpace(12),
        AppTextFormField(
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(
            IconBroken.Call,
            color: Colors.black, // Color when focused
          ),
          hintText: 'Phone',
          controller: cubit.phoneController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Phone must be required';
            }
            return null;
          },
        ),
        verticalSpace(40),
        AppTextButton(
          buttonText: 'UPDATE',
          buttonWidth: AppConstant.deviceWidth(context) / 1.4,
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.updateUserData(
                cubit.nameController.text,
                cubit.phoneController.text,
                cubit.locationController.text,
              );
            }
          },
          textStyle: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
