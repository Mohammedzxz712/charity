import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

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

  static EdietCubit get(context) => BlocProvider.of(context);

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
          emit(GetSuccessState());
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

  File? profilePhoto;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);
      emit(CameraSuccessState());
    } else {
      emit(CameraFailureState(error: 'No image selected'));
    }
  }

  void updateUserData(
    String name,
    String email,
    String phone,
    String location,
    File? profilePhoto,
  ) async {
    emit(LoadingUpdateState());

    try {
      // Create FormData
      FormData formData = FormData.fromMap({
        "name": name,
        "phone": phone,
        "email": email,
        "location": location,
        "_method": "PUT", // Ensure the backend recognizes the update method
      });

      if (profilePhoto != null) {
        formData.files.add(MapEntry(
          "image",
          await MultipartFile.fromFile(profilePhoto.path,
              filename: path.basename(profilePhoto.path)),
        ));
      }

      // Send the request using putData2
      Response? response = await DioHelper.putData2(
        url: ApiConstant.updateProfile,
        token: ApiConstant.token ?? '',
        data: formData,
      );

      if (response?.statusCode == 200) {
        getUserData();
        print(response?.data);
        emit(UpdateUserDataSuccessState());
      } else {
        emit(FailureState(
            error:
                "Failed to update profile. Status code: ${response?.statusCode}"));
      }
    } catch (error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    }
  }

// void updateUserData(
  //   String name,
  //   String email,
  //   String phone,
  //   String location,
  //   File? profilePhoto,
  // ) async {
  //   emit(LoadingUpdateState());
  //   DioHelper.putData(
  //     url: ApiConstant.updateProfile,
  //     token: ApiConstant.token ?? '',
  //     data: {
  //       "name": name,
  //       "phone": phone,
  //       "email": email,
  //       "location": location,
  //       if (profilePhoto != null)
  //         "image": await MultipartFile.fromFile(profilePhoto.path,
  //             filename: path.basename(profilePhoto.path)),
  //     },
  //   ).then((value) {
  //     getUserData();
  //     print(value?.data);
  //     emit(UpdateUserDataSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(FailureState(error: error.toString()));
  //   });
  // }
}
