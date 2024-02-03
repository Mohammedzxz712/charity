import 'package:charity/config/routes/router.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/components/custom_text_form_feild.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../components/common/build_rich_text.dart';

class ChoiseScreen extends StatelessWidget {
  static const String routeName = 'register';

  ChoiseScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(Assets.imagesFirist),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customRichText(
                        context: context,
                        textPartOne: 'Chari',
                        textPartTwo: 'ty',
                      ),
                      const Gap(30),
                      Container(
                        width: 307,
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffe4e4e4),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: 307,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
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
                    ],
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
