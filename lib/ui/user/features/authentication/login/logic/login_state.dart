part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class FailureState extends LoginState {
  final String error;

  FailureState({required this.error});
}

class LoginSuccessState extends LoginState {}

class ForgetSuccessState extends LoginState {}

class ResetSuccessState extends LoginState {}
