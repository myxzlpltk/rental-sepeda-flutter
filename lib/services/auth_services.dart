import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class AuthServices {
  AuthServices._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AppUser?> auth() async {
    User? user = _auth.currentUser;

    if (user == null) {
      return null;
    } else {
      return await UserServices.get(user.uid);
    }
  }

  static Future<Response<AppUser>> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user!;

      AppUser? appUser = await UserServices.get(user.uid);

      if (appUser != null) {
        return Response<AppUser>(true, data: appUser);
      } else {
        return Response<AppUser>(false, message: "Akun anda tidak valid.");
      }
    } on FirebaseAuthException catch (e) {
      return Response<AppUser>(false, message: e.message);
    } catch (e) {
      return Response<AppUser>(false, message: appError);
    }
  }

  static Future<Response<AppUser>> signUp(
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

      return Response<AppUser>(true, data: appUser);
    } on FirebaseAuthException catch (e) {
      return Response<AppUser>(false, message: e.message);
    } catch (e) {
      return Response<AppUser>(false, message: appError);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
