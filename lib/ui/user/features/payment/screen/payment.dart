import 'package:charity/core/constant/app_constant.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../paymob/paymop_manager.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  var amountController = TextEditingController();
  String dropdownValue = 'Public';
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: ColorsManager.mainColor,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Payment Details',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(20),
              AppTextFormField(
                controller: amountController,
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                hintText: 'Amount',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the payment amount';
                  }
                  return null;
                },
              ),
              verticalSpace(20),
              verticalSpace(20),
              isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      child: AppTextButton(
                        buttonText: 'Continue',
                        textStyle: const TextStyle(
                          color: ColorsManager.white,
                        ),
                        buttonWidth: AppConstant.deviceWidth(context) / 2,
                        backgroundColor: ColorsManager.mainColor,
                        buttonHeight: 40.h,
                        verticalPadding: 8,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await _pay(int.parse(amountController.text));
                              print('Payment successful');
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Payment failed: $error'),
                                ),
                              );
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pay(int amount) async {
    try {
      String paymentKey = await PaymobManager().getPaymentKey(amount, "EGP");
      await launchUrl(
        Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/847996?payment_token=$paymentKey"),
      );
    } catch (error) {
      throw 'Could not launch payment URL: $error';
    }
  }
}
