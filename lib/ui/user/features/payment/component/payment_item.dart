import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/components/custom_text_form_feild.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.controller,
    required this.height,
    required this.textIn,
    required this.textPre,
    this.width,
  });

  final TextEditingController controller;
  final String textIn;
  final String textPre;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.topLeft, child: Text(textPre)),
        SizedBox(
          height: height,
          width: width ?? double.infinity,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: CustomTextFormField(
              isPassword: false,
              maxLine: 1,
              hint: textIn,
              fillColor: Colors.white,
              filled: true,
              controller: controller,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              validate: (value) {
                if (value!.isEmpty) {
                  return "should enter $textPre";
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
