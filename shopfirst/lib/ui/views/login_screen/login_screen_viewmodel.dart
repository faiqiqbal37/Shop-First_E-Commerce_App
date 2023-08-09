import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreenViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final navigationController = locator<NavigationService>();
  final authService = locator<AuthenticationService>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Exception errorMessage = Exception();

  String _email = '';
  String _password = '';
  String _phone = '';

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // try {
    //   await _auth.signInWithEmailAndPassword(email: email, password: password);
    //   navigationController.navigateToSignupScreenView();
    // } catch (errorMessage) {
    //   print("Error: $errorMessage");
    // }
    authService.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signInWithPhoneNumber(String phone) async {
    // try {
    //   await _auth.signInWithPhoneNumber(phone);
    //   navigationController.navigateToSignupScreenView();
    // } catch (errorMessage) {
    //   print("Error: $errorMessage");
    // }
    authService.signInWithPhoneNumber(phone);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Future<void> signUpWithPhoneNumber(String phone, String password) async {}

  void showSnackbarSignUp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User Signed Up Successfully!'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }
}
