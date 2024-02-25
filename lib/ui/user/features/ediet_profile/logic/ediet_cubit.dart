import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ediet_state.dart';

class EdietCubit extends Cubit<EdietState> {
  EdietCubit() : super(EdietInitial());
}
