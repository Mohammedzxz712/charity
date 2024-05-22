part of 'complete_signup_cubit.dart';

abstract class CompleteSignUpState {}

class CompleteSignUpInitial extends CompleteSignUpState {}

class CompleteSignUpLoading extends CompleteSignUpState {}

class CompleteSignUpSuccess extends CompleteSignUpState {}

class SuccessCameraState extends CompleteSignUpState {}

class ErrorCameraState extends CompleteSignUpState {
  final String error;
  ErrorCameraState({required this.error});
}

class CompleteSignUpFailure extends CompleteSignUpState {
  final String error;

  CompleteSignUpFailure(this.error);
}
