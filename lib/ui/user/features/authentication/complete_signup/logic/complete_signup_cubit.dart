import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/dio_helper.dart';
part 'complete_signup_state.dart';

class CompleteSignupCubit extends Cubit<CompleteSignUpState> {
  CompleteSignupCubit() : super(CompleteSignUpInitial());

  var locationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();

  File? profilePhoto;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);
      emit(SuccessCameraState());
    } else {
      emit(FailureState(error: 'No image selected'));
    }
  }

  void completeSignUp(
    String phone,
    String location,
    File? profilePhoto,
  ) async {
    emit(CompleteSignUpLoading());

    try {
      // Create FormData
      FormData formData = FormData.fromMap({
        "phone": phone,
        "location": location,
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
        url: ApiConstant.completeRegister,
        token: ApiConstant.token ?? '',
        data: formData,
      );

      if (response?.statusCode == 200) {
        print(response?.data);
        emit(CompleteSignUpSuccess());
      } else {
        emit(CompleteSignUpFailure(
            "Failed to complete sign up. Status code: ${response?.statusCode}"));
      }
    } catch (error) {
      print(error.toString());
      emit(CompleteSignUpFailure("Error: ${error.toString()}"));
    }
  }
}
