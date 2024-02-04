import 'package:charity/config/style/icon_broken.dart';
import 'package:charity/core/components/custome_app_bar.dart';
import 'package:charity/ui/user/features/payment/component/payment_elevated.dart';
import 'package:charity/ui/user/features/payment/controller/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/routes/router.dart';
import '../../home/component/draewr.dart';
import '../component/payment_item.dart';
import '../paymob/paymop_manager.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isChecked = false;
  var cardNumController = TextEditingController();
  var cvcController = TextEditingController();
  var expirationController = TextEditingController();
  var donateController = TextEditingController();
  var amountController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomMainAppBar(
            isDrawerOpen: isDrawerOpen,
            onDrawerIconTap: () {
              setState(() {
                isDrawerOpen = !isDrawerOpen;
                if (isDrawerOpen) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            }),
        body: Stack(
          children: [
            Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        style: const TextStyle(height: .9),
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.grey), // Default border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color:
                                    Colors.grey), // Border color when focused
                          ),
                          labelText: 'Amount',
                          prefixIcon: const Icon(Icons.money),
                          labelStyle: const TextStyle(color: Colors.grey),
                          hintText: 'Enter the payment amount',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the payment amount';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          _pay(int.tryParse(amountController.text)!)
                              .then((value) => print('bbb'));
                          // PaymentManager.makePayment(
                          //     int.tryParse(amountController.text)!, 'EGP');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          // Use MaterialStateProperty.all instead of MaterialStatePropertyAll
                          const Color(0xff1DD56C),
                        ),
                        shape: MaterialStateProperty.all(
                          // Use MaterialStateProperty.all instead of MaterialStatePropertyAll
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: const Text(
                        'CONTINUE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomDrawer(
              isDrawerOpen: isDrawerOpen,
              controller: _controller,
              onHomeTap: () {
                Navigator.pushNamed(context, AppRoutes.home);
                setState(() {
                  isDrawerOpen = false;
                  _controller.reverse();
                });
              },
              onAboutTap: () {
                setState(() {
                  Navigator.pushNamed(context, AppRoutes.about);
                  isDrawerOpen = false;
                  _controller.reverse();
                });
              },
              onSupportTap: () {
                setState(() {
                  isDrawerOpen = false;
                  _controller.reverse();
                });
              },
              onSignOutTap: () {
                setState(() {
                  Navigator.pushNamed(context, AppRoutes.login);
                  isDrawerOpen = false;
                  _controller.reverse();
                });
              },
            ),
          ],
        ));
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
