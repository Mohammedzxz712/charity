import 'package:charity/ui/user/features/home/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(Initial());
  static HomeCubit get(context) => BlocProvider.of(context);
}
