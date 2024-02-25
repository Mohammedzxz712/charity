import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/methods/get_current_location.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  bool isObscureText = true;

  var passController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  Future<void> fetchCurrentAddress() async {
    emit(LoadingGetCurrentAddressState());
    GetCurrentLocation().getCurrentAddress().then((value) {
      locationController.text = value;
      emit(SuccessGetCurrentAddressState());
    }).catchError((error) {
      emit(ErrorGetUserLocationState());
    });
  }
}
