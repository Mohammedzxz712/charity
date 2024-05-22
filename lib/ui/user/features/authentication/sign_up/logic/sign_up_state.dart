part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class LoadingLocationSignUpState extends SignUpState {}

class SuccessGetCurrentAddressState extends SignUpState {}

class ErrorGetUserLocationState extends SignUpState {}

class SuccessRegisterState extends SignUpState {}

class ErrorRegisterState extends SignUpState {
  final String error;
  ErrorRegisterState({required this.error});
}
