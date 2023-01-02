import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/auth.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  Authentication authentication;
  AuthenticationCubit({required this.authentication})
      : super(AuthenticationInitial());

  Future signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      final response =
          await authentication.signIn(email: email, password: password);
      emit(SignInSccuessState());
    } on FirebaseAuthException {
      emit(SignInErrorState());
    } catch (error) {
      print(error);
    }
  }

  Future signInAnon() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
