part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class FailureState extends AuthState {
  final String error;

  FailureState({required this.error});
}

class LoginSuccessState extends AuthState {}

class RegisterSuccessState extends AuthState {}
