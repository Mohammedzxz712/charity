import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/api/api_constant.dart';
import '../../../../../core/api/dio_helper.dart';
import '../../../../../generated/assets.dart';
import '../../one_organization/data/model/categories.dart';
import '../components/boold_bottom_sheet.dart';
import '../components/cloth_bottom_sheet.dart';
import '../components/food_bottom_sheet.dart';
import '../components/house_ware_bottom_sheet.dart';
import '../components/money_bottom_sheet.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<String> methodName = ['دم', 'طعام', 'ملابس', 'اجهزه'];
  List<Categories>? categoriesList;
  void handleCategory(BuildContext context, int index) {
    final phrase = categoriesList?[index].name;

    if (phrase != null) {
      if (phrase.contains('دم')) {
        _showBottomSheet(context, const BloodDonationBottomSheet());
      } else if (phrase.contains('طعام')) {
        _showBottomSheet(context, const FoodDonationBottomSheet());
      } else if (phrase.contains('ملابس')) {
        _showBottomSheet(context, const ClotheDonationBottomSheet());
      } else if (phrase.contains('اجهزه')) {
        _showBottomSheet(context, const HouseWareDonationBottomSheet());
      } else if (phrase.contains('مال')) {
        _showBottomSheet(context, const MoneyDonationBottomSheet());
      } else {
        _showBottomSheet(context, const MoneyDonationBottomSheet());
        // Navigator.pushNamed(context, AppRoutes.payment);
      }
    } else {
      // Handle if phrase is null
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Category name is null.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => bottomSheet,
      isScrollControlled: true,
    );
  }

  void getOrganizationCategories(int id) {
    emit(OrganizationCategoriesLoading());

    DioHelper.getData(
      url: '${ApiConstant.categories}$id',
      token: ApiConstant.token,
    ).then((value) {
      if (value?.data != null) {
        print('Response data: ${value?.data}');
        try {
          List<dynamic> data = value?.data;
          categoriesList =
              data.map((json) => Categories.fromJson(json)).toList();
          print(
              categoriesList?.map((category) => category.description).toList());
          emit(CategoriesSuccessState(categoriesList!));
        } catch (e) {
          print('Parsing error: $e');
          emit(
              OrganizationCategoriesError("Failed to parse organization data"));
        }
      } else {
        print('No data available');
        emit(OrganizationCategoriesError("Failed to load organization data"));
      }
    }).catchError((error) {
      print('Error: $error');
      emit(OrganizationCategoriesError(error.toString()));
    });
  }
}
