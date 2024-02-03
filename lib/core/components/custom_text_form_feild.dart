import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.formFieldKey,
    required this.isPassword,
    this.type,
    this.controller,
    this.validate,
    this.onTap,
    this.suffixIcon,
    this.suffixPressed,
    this.border,
    this.edgeInsetsGeometry,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.maxLine,
    this.minLine,
    this.isEnable,
    this.scrollController,
    this.autofocus,
    this.focusNode,
    this.floatingLabelBehavior,
    this.hintTextDirection,
    this.hintMaxLines,
    this.onSaved,
    this.filled,
    this.fillColor,
    this.label,
  }) : super(key: key);

  final ScrollController? scrollController;
  final bool isPassword;
  final bool? autofocus;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String?)? onSubmitted;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validate;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? suffixPressed;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final String? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? isEnable;
  final bool? filled;
  final Color? fillColor;
  final int? maxLine;
  final int? minLine;
  final FocusNode? focusNode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final Key? formFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      scrollController: scrollController,
      obscureText: isPassword,
      keyboardType: type,
      controller: controller ?? TextEditingController(), // Initialize if null
      onFieldSubmitted: onSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validate,
      maxLines: maxLine,
      minLines: minLine,
      onTap: onTap,
      enabled: isEnable ?? true, // Provide a default value if null
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: filled ?? false, // Provide a default value if null
        fillColor: fillColor,
        hintText: hint,
        enabledBorder: border,
        focusedBorder: border,
        hintTextDirection: hintTextDirection,
        hintMaxLines: hintMaxLines,
        helperStyle: const TextStyle(
          decorationStyle: TextDecorationStyle.dotted,
        ),
        contentPadding: edgeInsetsGeometry,
        // prefixIcon: Icon(
        //   prefixIcon, // Provide a default value if null
        //   size: 20,
        //   color: Theme.of(context).colorScheme.onSurface,
        // ),
        // ... (other properties)
      ),
      cursorColor: const Color(AppColors.kPrimaryColor),
    );
  }
}
