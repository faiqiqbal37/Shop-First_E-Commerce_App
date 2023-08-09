import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigationController = locator<NavigationService>();

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (errorMessage) {
      print("Error: $errorMessage");
    }
  }

  Future<void> signUpWithPhoneNumber(String phone, String password) async {}

  void showSnackbarSignUp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User Signed Up Successfully!'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      navigationController.navigateToSignupScreenView();
    } catch (errorMessage) {
      print("Error: $errorMessage");
    }
  }

  @override
  Future<void> signInWithPhoneNumber(String phone) async {
    try {
      await _auth.signInWithPhoneNumber(phone);
      navigationController.navigateToSignupScreenView();
    } catch (errorMessage) {
      print("Error: $errorMessage");
    }
  }
}
