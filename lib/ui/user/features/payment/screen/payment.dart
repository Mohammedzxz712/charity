import 'package:charity/core/components/custome_app_bar.dart';
import 'package:charity/ui/user/features/payment/component/payment_elevated.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../config/routes/router.dart';
import '../../home/component/draewr.dart';
import '../component/payment_item.dart';

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
        backgroundColor: const Color(0xffE4E4E4),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                        color: Color(0xff1DD56C)),
                    child: const Center(
                        child: Text(
                      'Payment',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        PaymentItem(
                            controller: cardNumController,
                            height: 53,
                            textIn: '123 123 123 123',
                            textPre: 'CARD NUMBER'),
                        const Gap(24),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PaymentItem(
                                    controller: expirationController,
                                    height: 53,
                                    textIn: 'MM/YY',
                                    width: 142,
                                    textPre: 'Expiration')
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PaymentItem(
                                    controller: cvcController,
                                    height: 53,
                                    width: 142,
                                    textIn: 'CVC',
                                    textPre: 'CVC')
                              ],
                            ),
                          ],
                        ),
                        const Gap(24),
                        PaymentItem(
                            controller: donateController,
                            height: 53,
                            width: 142,
                            textIn: '0.0.0',
                            textPre: 'DONATE AMOUNT'),
                        const Gap(24),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color:
                                      _isChecked ? Colors.green : Colors.white,
                                  border: Border.all(
                                    color: Colors.white, // Set border color
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: _isChecked
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'I agree to terms & conditions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(11),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: PaymentElevated(
                        onPress: () {},
                      ),
                    ),
                  ),
                ],
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
