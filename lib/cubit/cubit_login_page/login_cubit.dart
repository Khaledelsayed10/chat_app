import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSaccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFaliure(errMessage: 'User not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFaliure(errMessage: 'Wrong password'));
      } else {
        emit(LoginFaliure(errMessage: 'Error: ${ex.message}'));
      }
    } catch (e) {
      emit(LoginFaliure(errMessage: 'Unexpected error occurred'));
    }
  }
}
