import 'package:cached_network_image/cached_network_image.dart';
import 'package:charity/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../data/model/category_item_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemModel categoryItemModel;
  const CategoryItem({
    super.key,
    required this.categoryItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: const Color(0xffEFF9F4),
      ),
      // You can customize the color or other properties
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: categoryItemModel.image,
                fit: BoxFit.fill,
                width: 125.0, // radius * 2
                height: 125.0, // radius * 2
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: ColorsManager.mainColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              categoryItemModel.txt,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
