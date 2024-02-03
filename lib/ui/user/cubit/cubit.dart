import 'package:bloc/bloc.dart';
import 'package:charity/ui/user/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../features/setting/screen/setting_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(IconlyBroken.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBroken.heart),
      label: 'Fav',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBroken.bag2),
      label: 'Card',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBroken.setting),
      label: 'Setting',
    ),
  ];

  // int currentIndex = 0;
  // List<Widget> screens = [
  //   HomeScreen(),
  //   const FavoriteScreen(),
  //   const CardScreen(),
  //   const SettingScreen(),
  // ];
  //
  // void changeBottomNav(int index) {
  //   currentIndex = index;
  //   emit(ChangeNavAppState());
  // }
}
