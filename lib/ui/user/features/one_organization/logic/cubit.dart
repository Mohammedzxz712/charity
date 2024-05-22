import 'package:charity/core/api/api_constant.dart';
import 'package:charity/ui/user/features/one_organization/data/model/categories.dart';
import 'package:charity/ui/user/features/one_organization/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/dio_helper.dart';
import '../data/model/OrganizationData.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit() : super(OrganizationInitial());

  static OrganizationCubit get(context) => BlocProvider.of(context);

  OrganizationData? organization;

  Categories? categories;

  void getOrganizationData(int id) {
    emit(OrganizationLoading());

    DioHelper.getData(
      url: '${ApiConstant.oneOrganization}$id',
      token: ApiConstant.token,
    ).then((value) {
      if (value?.data != null) {
        organization = OrganizationData.fromJson(value!.data);
        print(organization?.organization?.name);
        emit(OrganizationDescSuccess(organization!));
      } else {
        emit(OrganizationError("Failed to load organization data"));
      }
    }).catchError((error) {
      // Reset organization data to null
      organization = null;
      emit(OrganizationError(error.toString()));
    });
  }

  // void getOrganizationCategories(int id) {
  //   emit(OrganizationCategoriesLoading());
  //
  //   DioHelper.getData(
  //     url: '${ApiConstant.categories}$id',
  //     token: ApiConstant.token,
  //   ).then((value) {
  //     if (value?.data != null) {
  //       print('Response data: ${value?.data}');
  //       try {
  //         List<dynamic> data = value?.data;
  //         List<Categories> categoriesList =
  //             data.map((json) => Categories.fromJson(json)).toList();
  //         print(
  //             categoriesList.map((category) => category.description).toList());
  //         emit(CategoriesSuccessState(categoriesList));
  //       } catch (e) {
  //         print('Parsing error: $e');
  //         emit(
  //             OrganizationCategoriesError("Failed to parse organization data"));
  //       }
  //     } else {
  //       print('No data available');
  //       emit(OrganizationCategoriesError("Failed to load organization data"));
  //     }
  //   }).catchError((error) {
  //     print('Error: $error');
  //     emit(OrganizationCategoriesError(error.toString()));
  //   });
  // }

// void getOrganizationCategories(int id) {
  //   emit(OrganizationCategoriesLoading());
  //
  //   DioHelper.getData(
  //     url: '${ApiConstant.categories}$id',
  //     token: ApiConstant.token,
  //   ).then((value) {
  //     if (value?.data != null) {
  //       categories = Categories.fromJson(value!.data);
  //       print(categories?.description ?? 'No description available');
  //       emit(CategoriesSuccessState(categories!));
  //     } else {
  //       print('No data available');
  //       emit(OrganizationCategoriesError("Failed to load organization data"));
  //     }
  //   }).catchError((error) {
  //     // Reset organization data to null
  //     organization = null;
  //     print('Error: $error');
  //     emit(OrganizationCategoriesError(error.toString()));
  //   });
  // }
}
