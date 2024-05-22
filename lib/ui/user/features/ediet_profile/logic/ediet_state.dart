part of 'ediet_cubit.dart';

@immutable
abstract class EdietState {}

class EdietInitial extends EdietState {}

class LoadingState extends EdietState {}

class LoadingUpdateState extends EdietState {}

class FailureState extends EdietState {
  final String error;

  FailureState({required this.error});
}

class EdietSuccessState extends EdietState {}

class UpdateUserDataSuccessState extends EdietState {}
