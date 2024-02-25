import 'package:charity/core/constant/app_constant.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:charity/ui/user/features/payment/component/drop_down_buttom.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                controller: amountController,
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                hintText: 'AMOUNT',
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
              verticalSpace(40),
              CustomDropdownButton(
                value: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
              verticalSpace(20),
              SizedBox(
                child: AppTextButton(
                  buttonText: 'CONTINUE',
                  textStyle: const TextStyle(
                    color: ColorsManager.white,
                  ),
                  buttonWidth: AppConstant.deviceWidth(context) / 2,
                  backgroundColor: ColorsManager.mainColor,
                  buttonHeight: 40.h,
                  verticalPadding: 8,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      _pay(int.tryParse(amountController.text)!)
                          .then((value) => print('bbb'));
                      // PaymentManager.makePayment(
                      //     int.tryParse(amountController.text)!, 'EGP');
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
}

Future<void> _pay(int amount) async {
  PaymobManager().getPaymentKey(amount, "EGP").then((String paymentKey) {
    launchUrl(
      Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/821551?payment_token=$paymentKey"),
    );
  });
}

// SingleChildScrollView(
// child: Column(
// children: [
// Container(
// height: 220,
// width: double.infinity,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(80),
// bottomRight: Radius.circular(80)),
// color: Color(0xff1DD56C)),
// child: const Center(
// child: Text(
// 'Payment',
// style:
// TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
// )),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Gap(24),
// PaymentItem(
// controller: cardNumController,
// height: 53,
// textIn: '123 123 123 123',
// textPre: 'CARD NUMBER'),
// const Gap(24),
// Row(
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// PaymentItem(
// controller: expirationController,
// height: 53,
// textIn: 'MM/YY',
// width: 142,
// textPre: 'Expiration')
// ],
// ),
// const Spacer(),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// PaymentItem(
// controller: cvcController,
// height: 53,
// width: 142,
// textIn: 'CVC',
// textPre: 'CVC')
// ],
// ),
// ],
// ),
// const Gap(24),
// PaymentItem(
// controller: donateController,
// height: 53,
// width: 142,
// textIn: '0.0.0',
// textPre: 'DONATE AMOUNT'),
// const Gap(24),
// Row(
// children: [
// GestureDetector(
// onTap: () {
// setState(() {
// _isChecked = !_isChecked;
// });
// },
// child: Container(
// width: 24,
// height: 24,
// decoration: BoxDecoration(
// color:
// _isChecked ? Colors.green : Colors.white,
// border: Border.all(
// color: Colors.white, // Set border color
// ),
// borderRadius: BorderRadius.circular(4),
// ),
// child: _isChecked
// ? const Icon(
// Icons.check,
// color: Colors.white,
// size: 18,
// )
//     : null,
// ),
// ),
// const SizedBox(width: 8),
// const Text(
// 'I agree to terms & conditions',
// style: TextStyle(fontSize: 16),
// ),
// ],
// ),
// ],
// ),
// ),
// const Gap(11),
// SizedBox(
// height: 50,
// width: double.infinity,
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 19),
// child: PaymentElevated(
// onPress: () {},
// ),
// ),
// ),
// ],
// ),
// ),
