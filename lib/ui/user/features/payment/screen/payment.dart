import 'package:charity/core/constant/app_constant.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:charity/ui/user/features/payment/new_paymob/new_paymop_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/widgets/app_text_bottom.dart';
import '../paymob/paymop_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        title: Text(AppLocalizations.of(context)!.payment),
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
                AppLocalizations.of(context)!.enterpaymentdetails,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(20.h),
              AppTextFormField(
                controller: amountController,
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                hintText: AppLocalizations.of(context)!.amount,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseenterthepaymentamount;
                  }
                  return null;
                },
              ),
              verticalSpace(20.h),
              verticalSpace(20.h),
              isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      child: AppTextButton(
                        buttonText: AppLocalizations.of(context)!.continues,
                        textStyle: const TextStyle(
                          color: ColorsManager.white,
                        ),
                        buttonWidth: AppConstant.deviceWidth(context) / 2,
                        backgroundColor: ColorsManager.mainColor,
                        buttonHeight: 40.h,
                        verticalPadding: 8.h,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await _pay(int.parse(amountController.text));
                              print(AppLocalizations.of(context)!.paymentsuccessful);
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${AppLocalizations.of(context)!.paymentfailed} $error'),
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
       NewPaymobManager().newGetPaymentKey(amount, "EGP").then((String paymentKey){
          launchUrl(
           Uri.parse(
               "https://accept.paymob.com/api/acceptance/iframes/852844?payment_token=$paymentKey"),
         );
       });

    } catch (error) {
      throw 'Could not launch payment URL: $error';
    }
  }
}
