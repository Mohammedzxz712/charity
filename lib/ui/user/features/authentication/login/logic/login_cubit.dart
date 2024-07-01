import 'package:charity/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/dio_helper.dart';
import '../data/model/user_login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  bool isObscureText = true;

  final TextEditingController otpController = TextEditingController();

  var passController = TextEditingController();

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    DioHelper.postData(
      url: ApiConstant.login,
      data: {'email': email, 'password': password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      if (loginModel?.token != null) {
        CacheHelper.saveData(
          key: 'token',
          value: 'Bearer ${value?.data['token']}',
        );
        CacheHelper.saveData(
          key: 'id',
          value: value?.data['id'],
        );
      }
      ApiConstant.token = 'Bearer ${loginModel?.token}';
      ApiConstant.id = value?.data['id'];
      print(ApiConstant.token);
      print(ApiConstant.id);
      print(CacheHelper.getBool(key: 'token'));
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void forgetPassword({
    required String email,
  }) {
    emit(LoadingState());
    DioHelper.postData(url: ApiConstant.forgetPassword, data: {'email': email})
        .then((value) {
      print(value);
      emit(ForgetSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void resetPassword({
    required String email,
    required String password,
    required String otp,
  }) {
    emit(LoadingState());
    DioHelper.postData(
        token: ApiConstant.token ?? "",
        url: ApiConstant.reset,
        data: {'email': email, 'password': password, 'otp': otp}).then((value) {
      print(value);
      emit(ResetSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }
}
