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
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              child: SvgPicture.asset(
                categoryItemModel.image,
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
