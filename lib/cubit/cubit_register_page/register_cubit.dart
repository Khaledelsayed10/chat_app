import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFaliure(errMessage: ' weak-password'));
      } else if (ex.code == 'emil-already-in-use') {
        emit(RegisterFaliure(errMessage: 'emil already exists'));
      } else {
        emit(RegisterFaliure(errMessage: 'Error: ${ex.message}'));
      }
    } catch (e) {
      emit(RegisterFaliure(errMessage: 'there eas an error'));
    }
  }
}
