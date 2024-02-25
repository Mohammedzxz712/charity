import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../generated/assets.dart';
import '../components/boold_bottom_sheet.dart';
import '../components/cloth_bottom_sheet.dart';
import '../components/food_bottom_sheet.dart';
import '../components/house_ware_bottom_sheet.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<String> methodName = [
    'BY MONEY',
    'BY CLOTHES',
    'BY FOOD',
    'BY BLOOD',
    'BY HOUSEWARES'
  ];
  List<String> methodImage = [
    Assets.imagesIconopenDollar,
    Assets.imagesIconmapClothingStore,
    Assets.imagesIconmapFood,
    Assets.imagesIconmetroInjection,
    Assets.imagesWashingMachineSvgrepoCom,
  ];
  void handleCategory(BuildContext context, int index) {
    switch (methodName[index]) {
      case 'BY BLOOD':
        _showBottomSheet(context, const BloodDonationBottomSheet());
        break;
      case 'BY FOOD':
        _showBottomSheet(context, const FoodDonationBottomSheet());
        break;
      case 'BY CLOTHES':
        _showBottomSheet(context, const ClotheDonationBottomSheet());
        break;
      case 'BY HOUSEWARES':
        _showBottomSheet(context, const HouseWareDonationBottomSheet());
        break;
      default:
        Navigator.pushNamed(context, AppRoutes.payment);
    }
  }

  void _showBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => bottomSheet,
    );
  }
}
