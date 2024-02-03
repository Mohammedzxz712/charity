import 'package:flutter/material.dart';

import 'custom_flexible_space.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      backgroundColor: const Color(0xff303030),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          color: Colors.grey,
          Icons.arrow_back_ios_new_outlined,
          size: 30,
        ),
      ),
      expandedHeight: height,
      flexibleSpace: CustomFlexibleSpaceBar(
        image: image,
      ),
    );
  }
}
