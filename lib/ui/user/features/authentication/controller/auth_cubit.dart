//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    // emit(LoadingState());
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: email, password: password)
    //     .then((value) {
    //   emit(LoginSuccessState());
    // }).catchError((error) {
    //   emit(FailureState(error: error.toString()));
    // });
  }

  void userRegister({required String email, required String password}) {
    emit(LoadingState());
    //   FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(email: email, password: password)
    //       .then((value) {
    //     emit(RegisterSuccessState());
    //   }).catchError((error) {
    //     emit(FailureState(error: error.toString()));
    //   });
    // }
  }
}
