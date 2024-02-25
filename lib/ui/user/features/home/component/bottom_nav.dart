import 'package:charity/config/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/routes.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 55,
        color: Colors.white,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.about);
          },
          child:
              const Text('LEARN MORE', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
