import 'package:charity/ui/user/features/one_organization/data/model/categories.dart';

import 'package:charity/ui/user/features/one_organization/data/model/categories.dart';

import '../data/model/OrganizationData.dart';

abstract class OrganizationState {}

class OrganizationInitial extends OrganizationState {}

class OrganizationLoading extends OrganizationState {}

class OrganizationDescSuccess extends OrganizationState {
  final OrganizationData organization;

  OrganizationDescSuccess(this.organization);
}

class OrganizationError extends OrganizationState {
  final String errorMessage;

  OrganizationError(this.errorMessage);
}

// class OrganizationCategoriesError extends OrganizationState {
//   final String errorMessage;
//
//   OrganizationCategoriesError(this.errorMessage);
// }
// class CategoriesSuccessState extends OrganizationState {
//   final Categories categories;
//
//   CategoriesSuccessState(this.categories);
// }
// class OrganizationCategoriesLoading extends OrganizationState {}

// class OrganizationCategoriesLoading extends OrganizationState {}
//
// class CategoriesSuccessState extends OrganizationState {
//   final List<Categories> categories;
//
//   CategoriesSuccessState(this.categories);
// }
//
// class OrganizationCategoriesError extends OrganizationState {
//   final String errorMessage;
//
//   OrganizationCategoriesError(this.errorMessage);
// }
