import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../config/style/styles.dart';
import '../../../../../core/helpers/spacing.dart';

class CombineScreen extends StatelessWidget {
  String imageAsset;
  String title;

  String description;

  String endDate;

  String amount;
  CombineScreen(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.description,
      required this.amount,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0.r),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesFirist),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.black,
                    )),
                Text(description,
                    style: const TextStyle(
                      color: Colors.black,
                    )),
                verticalSpace(3.h),
                Text('المبلغ المحدد ${amount}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.payment);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child:  Text('تبرع الان',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            )),
                      ),
                    ),
                    horizontalSpace(15.w),
                    Text(
                      endDate.length > 10 ? endDate.substring(0, 10) : endDate,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 8.w, // Change right to left
            top: 15.h,
            bottom: 2,
            child: CachedNetworkImage(

              imageUrl: imageAsset, // Replace with your image URL
              placeholder: (context, url) =>
                  CircularProgressIndicator(), // Optional placeholder widget while loading
              errorWidget: (context, url, error) => Icon(
                  Icons.error), // Optional error widget if image fails to load
              height: 130.h,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
