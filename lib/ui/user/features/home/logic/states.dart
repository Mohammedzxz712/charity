abstract class HomeStates {}

class Initial extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}

class HomeSuccessCampaignState extends HomeStates {}
