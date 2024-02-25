import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/assets.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            Assets.imagesFacebook,
          ),
          radius: 15,
        ),
        horizontalSpace(12),
        const CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            Assets.imagesLinkedin,
          ),
          radius: 15,
        ),
        horizontalSpace(12),
        const CircleAvatar(
          backgroundImage: AssetImage(
            Assets.imagesTwitter,
          ),
          radius: 15,
        ),
      ],
    );
  }
}
