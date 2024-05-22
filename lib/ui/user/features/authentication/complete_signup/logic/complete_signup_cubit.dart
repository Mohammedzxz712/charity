import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
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
      emit(ErrorCameraState(error: 'No Image Selected'));
    }
  }

  void completeRegister({
    required String location,
    required File image,
    required int userId,
  }) {
    emit(CompleteSignUpLoading());

    // Convert the image file to a base64 string or formData if needed
    String base64Image = base64Encode(image.readAsBytesSync());

    DioHelper.postData(
      url: ApiConstant.completeRegister,
      lang: 'en',
      data: {
        'location': location,
        'user_id': userId,
        'image': base64Image,
      },
    ).then((value) {
      print(value.toString());
      emit(CompleteSignUpSuccess());
    }).catchError((error) {
      print(
          '----------------------------------------------${error.toString()}');
      emit(CompleteSignUpFailure(error.toString()));
    });
  }
}
