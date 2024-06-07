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

class GetSuccessState extends EdietState {}

class CameraSuccessState extends EdietState {}

class CameraFailureState extends EdietState {
  final String error;

  CameraFailureState({required this.error});
}

class UpdateUserDataSuccessState extends EdietState {}
