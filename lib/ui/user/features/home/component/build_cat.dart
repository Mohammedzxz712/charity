import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity/config/colors/app_colors.dart';
import 'package:charity/ui/user/features/home/data/model/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../config/routes/routes.dart';

class BuildCategory extends StatelessWidget {
  String imageAsset;
  String title;

  String description;

  BuildCategory(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201.h,
      width: 373.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CachedNetworkImage(
              imageUrl: imageAsset,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: ColorsManager.mainColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 201.h,
              width: 373.w,
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 201.h,
                    width: 373.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    width: 373.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: Colors.black.withOpacity(0.35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style:  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    height: 1.2.h,
                                  ),
                                ),
                                Gap(5.h),
                                Text(
                                  description,
                                  style:  TextStyle(
                                    color: ColorsManager.lighterGray,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14.sp,
                                    height: 1.3.h,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
