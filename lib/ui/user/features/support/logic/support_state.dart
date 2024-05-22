part of 'support_cubit.dart';

@immutable
abstract class SupportState {}

class SupportInitial extends SupportState {}

class SupportLoadingState extends SupportState {}

class ReviewLoadingState extends SupportState {}

class SupportSuccessState extends SupportState {}

class GetReviewsSuccessState extends SupportState {}

class SupportErrorState extends SupportState {
  final String error;
  SupportErrorState({required this.error});
}
