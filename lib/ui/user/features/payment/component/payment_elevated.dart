import 'package:flutter/material.dart';

class PaymentElevated extends StatelessWidget {
  Function onPress;

  PaymentElevated({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Color(0xff1DD56C)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
            side: const BorderSide(
              color: Color(0xff1DD56C),
            ),
          ),
        ),
      ),
      onPressed: onPress(),
      child: const Text(
        'DONATE',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
