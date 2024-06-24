import 'package:charity/ui/user/features/payment/new_paymob/new_paymop_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../../payment/paymob/paymop_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MoneyDonationBottomSheet extends StatefulWidget {
  const MoneyDonationBottomSheet({Key? key}) : super(key: key);

  @override
  _MoneyDonationBottomSheetState createState() =>
      _MoneyDonationBottomSheetState();
}

class _MoneyDonationBottomSheetState extends State<MoneyDonationBottomSheet>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  var amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fieldWidth =
        screenWidth * 0.8; // Set field width to 80% of screen width

    return Container(
      height: isKeyboardVisible
          ? screenHeight * 0.8
          : screenHeight * 0.5, // Adjust height based on keyboard visibility
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Gap(22.h),
           Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.moneydonationdetails,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           SizedBox(height: 28.h),
          SizedBox(
            width: fieldWidth,
            child: AppTextFormField(
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
          ),
           SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                _pay(int.tryParse(amountController.text)!)
                    .then((value) => print('bbb'));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff1DD56C),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child:  Text(
                AppLocalizations.of(context)!.submit,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
