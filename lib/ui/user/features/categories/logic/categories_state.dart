part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class OrganizationCategoriesLoading extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<Categories> categories;

  CategoriesSuccessState(this.categories);
}

class OrganizationCategoriesError extends CategoriesState {
  final String errorMessage;

  OrganizationCategoriesError(this.errorMessage);
}
