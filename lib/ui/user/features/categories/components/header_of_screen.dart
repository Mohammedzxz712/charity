import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'CHAR',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: 'ITY',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              )
            ],
          ),
        ),
        const Text(
          'CATEGORIES',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
