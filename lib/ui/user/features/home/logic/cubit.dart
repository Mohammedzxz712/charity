import 'package:charity/ui/user/features/home/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/api_constant.dart';
import '../../../../../core/api/dio_helper.dart';
import '../data/model/Camp.dart';
import '../data/model/getAllOrganizations.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(Initial());
  static HomeCubit get(context) => BlocProvider.of(context);

  GetAllOrganizations? getAllOrganizationsModel;
  Camp? campModel;

  Map<int, bool> favorite = {};
  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: ApiConstant.organizations,
      token: ApiConstant.token,
    ).then((value) {
      getAllOrganizationsModel = GetAllOrganizations.fromJson(value?.data);
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState(error: error.toString()));
    });
  }

  void getCombine() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: ApiConstant.campaigns,
      token: ApiConstant.token,
    ).then((value) {
      campModel = Camp.fromJson(value?.data);
      print(campModel?.allCampaign?[0]);
      emit(HomeSuccessCampaignState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState(error: error.toString()));
    });
  }
}
