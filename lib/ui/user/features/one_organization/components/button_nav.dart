import 'package:charity/config/routes/routes.dart';
import 'package:charity/ui/user/features/categories/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class ButtonNavDonate extends StatelessWidget {
  final organizationId;
  const ButtonNavDonate({required this.organizationId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        color: Colors.white,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrganizationMethod(organizationId: organizationId),
                ));
          },
          child:
              const Text('DONATE NOW', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}