import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_constant.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: AppConstant.deviceWidth(context),
            height: AppConstant.deviceHeight(context) / 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.only(
                bottomRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Icon(
            IconlyBroken.play,
            size: 70,
          ),
        ],
      ),
    );
  }
}
