import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';

class CustomTwoTextFromField extends StatelessWidget {
  const CustomTwoTextFromField({
    Key? key,
    required this.controller1,
    required this.controller2,
    required this.label1,
    required this.label2,
    required this.hint1,
    required this.hint2,
    required this.isPass,
    required this.isPass2,
    this.prefixIcon1,
    this.prefixIcon2,
    this.fillColor,
    this.filled,
  }) : super(key: key);

  final TextEditingController controller1;
  final TextEditingController controller2;
  final String label1;
  final String label2;
  final String? hint1;
  final String? hint2;
  final bool? filled;
  final Color? fillColor;
  final bool isPass;
  final bool isPass2;
  final IconData? prefixIcon1;
  final IconData? prefixIcon2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label1),
        const Gap(10),
        CustomTextFormField(
          isPassword: isPass,
          maxLine: 1,
          controller: controller1,
          filled: filled,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          label: label1,
          hint: hint1,
          validate: (value) {
            if (value!.isEmpty) {
              return "should enter $label1";
            } else if (!isEmailValid(value)) {
              return 'email must contain @ & .com';
            } else {
              return null;
            }
          },
          prefixIcon: prefixIcon1,
          edgeInsetsGeometry: const EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
        const Gap(10),
        Text(label2),
        const Gap(10),
        CustomTextFormField(
          isPassword: isPass2,
          maxLine: 1,
          controller: controller2,
          filled: filled,
          hint: hint2,
          fillColor: fillColor,
          validate: (value) {
            if (value!.isEmpty) {
              return "should enter $label2";
            } else if (!isPasswordValid(value)) {
              return 'Password must include: 0-9, A-Z, a-z, and special characters';
            } else {
              return null;
            }
          },
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)),
          label: label2,
          prefixIcon: prefixIcon2,
          edgeInsetsGeometry: const EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
      ],
    );
  }
}
//
