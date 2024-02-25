import 'package:charity/config/style/styles.dart';
import 'package:charity/core/constant/app_constant.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../../config/style/icon_broken.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyles.font17WhiteMedium,
        ),
        titleSpacing: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextFormField(
              prefixIcon: const Icon(
                IconBroken.User,
                color: Colors.black,
              ),
              hintText: 'Name',
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name must be required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            AppTextFormField(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              hintText: 'Email',
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email must be required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            AppTextFormField(
              prefixIcon: const Icon(
                IconBroken.Call,
                color: Colors.black, // Color when focused
              ),
              hintText: 'Phone',
              controller: phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Phone must be required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            AppTextButton(
              buttonText: 'UPDATE',
              buttonWidth: AppConstant.deviceWidth(context) / 1.4,
              onPressed: () {},
              textStyle: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
