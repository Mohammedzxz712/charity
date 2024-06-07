import 'package:bloc/bloc.dart';
import 'package:charity/core/api/dio_helper.dart';
import 'package:charity/ui/user/features/support/data/model/AllReview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_constant.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());

  var nameController = TextEditingController();
  var problemController = TextEditingController();
  var emailController = TextEditingController();

  static SupportCubit get(context) => BlocProvider.of(context);

  void support({
    required String text,
    required int useId,
  }) {
    emit(SupportLoadingState());
    DioHelper.postData(
      url: ApiConstant.support,
      token: ApiConstant.token ?? "",
      data: {
        'text': text,
        'user_id': useId,
      },
    ).then((value) {
      getReviews();
      emit(SupportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SupportErrorState(error: error.toString()));
    });
  }

  List<Reviews>? reviewList;
  AllReview? allReview;

  void getReviews() {
    emit(ReviewLoadingState());
    DioHelper.getData(
      url: ApiConstant.reviews,
      token: ApiConstant.token,
    ).then((value) {
      allReview = AllReview.fromJson(value?.data);
      reviewList = allReview?.reviews;

      print(reviewList?[0].text);
      emit(GetReviewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SupportErrorState(error: error.toString()));
    });
  }
}
