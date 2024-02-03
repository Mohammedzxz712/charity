import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../../core/methods/validate_email/vaildate_email.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(Assets.imagesFirist),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Form(
            key: formKey,
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
                          textPartOne: 'Sign ',
                          textPartTwo: 'UP',
                        ),
                        const Gap(30),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Full Name',
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                              isPassword: false,
                              maxLine: 1,
                              hint: 'mohammed',
                              prefixIcon: IconlyBroken.profile,
                              fillColor: Colors.white,
                              filled: true,
                              controller: nameController,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              label: 'username',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "should enter username";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const Gap(10),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Phone',
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                            isPassword: false,
                            type: TextInputType.phone,
                            maxLine: 1,
                            hint: '01555555555',
                            prefixIcon: IconlyBroken.profile,
                            fillColor: Colors.white,
                            filled: true,
                            controller: phoneController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            label: 'phone',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "should enter username";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        const Align(
                            alignment: Alignment.topLeft, child: Text('Email')),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                            isPassword: false,
                            maxLine: 1,
                            hint: 'example@gmail.com',
                            fillColor: Colors.white,
                            filled: true,
                            controller: emailController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "should enter email";
                              } else if (!isEmailValid(value)) {
                                return 'email must contain @ & .com';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Password')),
                        const Gap(10),
                        SizedBox(
                          height: 53,
                          child: CustomTextFormField(
                            isPassword: false,
                            maxLine: 1,
                            hint: '****************',
                            fillColor: Colors.white,
                            filled: true,
                            controller: passController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "should enter password";
                              } else if (!isPasswordValid(value)) {
                                return 'Password must include: 0-9, A-Z, a-z, and special characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: 197,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                Color(0xff1DD56C),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text('SIGN UP'),
                          ),
                        ),
                        customTextNextToTextButton(
                          context: context,
                          text: 'Already have account?',
                          textButton: 'Login',
                          onPressed: () {
                            Navigator.pop(context);
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
  }
}
