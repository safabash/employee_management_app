import 'package:employee_management_app/shared/utils/snackbar_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register({String? email, String? password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      SnackbarUtil.showSuccessSnackbar(
          'Success', 'User registered successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackbarUtil.showErrorSnackbar(
            'Error', 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        SnackbarUtil.showErrorSnackbar(
            'Error', 'The account already exists for that email.');
      }
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', e.toString());
    }
  }

  Future<void> login({String? email, String? password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      SnackbarUtil.showSuccessSnackbar(
          'Success', 'User logged in successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackbarUtil.showErrorSnackbar(
            'Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        SnackbarUtil.showErrorSnackbar(
            'Error', 'Wrong password provided for that user.');
      }
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Error', e.toString());
    }
  }
}
