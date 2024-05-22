import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/dio_helper.dart';
import '../../../../../../core/cache/cache_helper.dart';
import '../../../../../../core/methods/get_current_location.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  bool isObscureText = true;

  var passController = TextEditingController();
  var confirmPassController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  Future<void> fetchCurrentAddress() async {
    emit(LoadingLocationSignUpState());
    GetCurrentLocation().getCurrentAddress().then((value) {
      locationController.text = value;
      emit(SuccessGetCurrentAddressState());
    }).catchError((error) {
      emit(ErrorGetUserLocationState());
    });
  }

  int? userId;
  void userRegister({
    required String email,
    required String password,
    required String name,
  }) {
    emit(LoadingSignUpState());
    DioHelper.postData(
      url: ApiConstant.register,
      lang: 'en',
      data: {
        'email': email,
        'password': password,
        'name': name,
      },
    ).then((value) {
      CacheHelper.saveData(
          key: 'token', value: 'Bearer ${value?.data['token']}');
      userId = value?.data['id'];
      print(userId);
      print(CacheHelper.getBool(key: 'token'));

      emit(SuccessRegisterState());
    }).catchError((error) {
      print(
          '----------------------------------------------${error.toString()}');
      emit(
        ErrorRegisterState(
          error: error.toString(),
        ),
      );
    });
  }
}
