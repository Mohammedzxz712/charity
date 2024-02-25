part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingGetCurrentAddressState extends SignUpState {}

class SuccessGetCurrentAddressState extends SignUpState {}

class ErrorGetUserLocationState extends SignUpState {}
