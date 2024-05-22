import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MoneyDonationBottomSheet extends StatefulWidget {
  const MoneyDonationBottomSheet({Key? key}) : super(key: key);

  @override
  _MoneyDonationBottomSheetState createState() =>
      _MoneyDonationBottomSheetState();
}

class _MoneyDonationBottomSheetState extends State<MoneyDonationBottomSheet>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

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
          const Gap(22),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Money Donation Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: fieldWidth,
            child: TextFormField(
              style: const TextStyle(height: .9),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'Type of Money',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {},
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
              child: const Text(
                'SUBMIT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
