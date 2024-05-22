import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_constant.dart';
import '../../../../../core/api/dio_helper.dart';
import '../data/model/get_profile.dart';

part 'ediet_state.dart';

class EdietCubit extends Cubit<EdietState> {
  EdietCubit() : super(EdietInitial());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GetProfile? GetProfileModel;

  void getUserData() {
    emit(LoadingState());
    DioHelper.getData(
      url: ApiConstant.getProfile,
      token: ApiConstant.token,
    ).then((response) {
      if (response?.statusCode == 200) {
        // Assuming the response body is a map
        Map<String, dynamic> responseBody = response?.data;

        // Check if the response contains the expected data
        if (responseBody.containsKey("id")) {
          // Parse the data accordingly
          GetProfileModel = GetProfile.fromJson(responseBody);
          print(GetProfileModel!.name);
          emit(EdietSuccessState());
        } else {
          // Handle the case when the response does not contain the expected data
          emit(FailureState(error: "Response does not contain 'id'"));
        }
      } else {
        // Handle HTTP errors
        emit(FailureState(error: "HTTP Error: ${response?.statusCode}"));
      }
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void updateUserData(
    String name,
    String phone,
    String location,
  ) {
    emit(LoadingUpdateState());
    DioHelper.putData(
      url: ApiConstant.updateProfile,
      token: ApiConstant.token ?? '',
      data: {
        "name": name,
        "location": location,
        "phone": phone,
      },
    ).then((value) {
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }
}
