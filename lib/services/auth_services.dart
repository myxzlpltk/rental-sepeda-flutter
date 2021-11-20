import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AppUser?> auth() async {
    User? user = _auth.currentUser;

    if (user == null) {
      return null;
    } else {
      return await UserServices.get(user.uid);
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user!;

      AppUser? appUser = await UserServices.get(user.uid);

      if (appUser != null) {
        return SignInSignUpResult(user: appUser);
      } else {
        return SignInSignUpResult(message: "Akun anda tidak valid.");
      }
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message);
    } catch (e) {
      return SignInSignUpResult(message: errorAppString);
    }
  }

  static Future<SignInSignUpResult> signUp(
      String name, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user!;

      AppUser appUser = AppUser(
        id: user.uid,
        name: name,
        email: user.email!,
      );

      await UserServices.create(appUser);

      return SignInSignUpResult(user: appUser);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(message: e.message);
    } catch (e) {
      return SignInSignUpResult(message: errorAppString);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SignInSignUpResult {
  final AppUser? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}
