import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  static EdietCubit get(context) => BlocProvider.of(context);

  void initControllers() {
    nameController.addListener(() {
      if (GetProfileModel != null) {
        GetProfileModel!.name = nameController.text;
      }
    });
    emailController.addListener(() {
      if (GetProfileModel != null) {
        GetProfileModel!.email = emailController.text;
      }
    });
    phoneController.addListener(() {
      if (GetProfileModel != null) {
        GetProfileModel!.phone = phoneController.text;
      }
    });
    locationController.addListener(() {
      if (GetProfileModel != null) {
        GetProfileModel!.location = locationController.text;
      }
    });
  }

  void getUserData() {
    emit(LoadingState());
    DioHelper.getData(
      url: ApiConstant.getProfile,
      token: ApiConstant.token,
    ).then((response) {
      if (response?.statusCode == 200) {
        Map<String, dynamic> responseBody = response?.data;
        if (responseBody.containsKey("id")) {
          GetProfileModel = GetProfile.fromJson(responseBody);
          nameController.text = GetProfileModel!.name ?? '';
          emailController.text = GetProfileModel!.email ?? '';
          phoneController.text = GetProfileModel!.phone ?? '';
          locationController.text = GetProfileModel!.location ?? '';
          initControllers();
          emit(GetSuccessState());
        } else {
          emit(FailureState(error: "Response does not contain 'id'"));
        }
      } else {
        emit(FailureState(error: "HTTP Error: ${response?.statusCode}"));
      }
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void clearTextFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    locationController.clear();
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
      FormData formData = FormData.fromMap({
        "name": name,
        "phone": phone,
        "email": email,
        "location": location,
        "_method": "PUT",
      });

      if (profilePhoto != null) {
        formData.files.add(MapEntry(
          "image",
          await MultipartFile.fromFile(profilePhoto.path,
              filename: path.basename(profilePhoto.path)),
        ));
      }

      Response? response = await DioHelper.putData2(
        url: ApiConstant.updateProfile,
        token: ApiConstant.token ?? '',
        data: formData,
      );

      if (response?.statusCode == 200) {
        clearTextFields(); // Clear the text fields after successful update
        getUserData();
        emit(UpdateUserDataSuccessState());
      } else {
        emit(FailureState(
            error:
            "Failed to update profile. Status code: ${response?.statusCode}"));
      }
    } catch (error) {
      emit(FailureState(error: error.toString()));
    }
  }
}
