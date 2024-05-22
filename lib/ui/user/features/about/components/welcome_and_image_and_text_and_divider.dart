import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/assets.dart';

class WelcomeAndImageAndTextAndDivider extends StatelessWidget {
  const WelcomeAndImageAndTextAndDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(15),
        RichText(
          text: TextSpan(
            text: 'WELCOME TO',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: ' OUR CHARITY',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              )
            ],
          ),
        ),
        verticalSpace(15),
        const Image(
          image: AssetImage(Assets.imagesKrakenimagesY5bvRlcCx8kUnsplash),
        ),
        const Text(
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.9),
            'WE RE A PASSIONATE AND DEDICATED TEAM WORKING RELENTLESSLY TO MAKE APOSITIVE IMPACT IN THE WORLD. OURMISSION IS TO UPLIFT COMMUNITIE,PROVIDE ESSENTIAL RESOURCES , ANDPROMOTE EQUALITY FOR ALL. TOGETHERWE CAN CREATE POSITIVE CHANGE BYSUPPORTING THOSE IN NEED'),
        verticalSpace(17.5),
        const Divider(
          color: Colors.black,
          thickness: 2,
          indent: 140,
          endIndent: 140,
        ),
        verticalSpace(12),
      ],
    );
  }
}
