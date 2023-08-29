import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopfirst/app/app.bottomsheets.dart';
import 'package:shopfirst/app/app.dialogs.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/models/user/user_model.dart' as UserModel;
import 'package:restart_app/restart_app.dart';

import '../app/app.locator.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('users');
  final db = FirebaseFirestore.instance.collection('users');
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserModel.User? userToken = UserModel.User(
      userId: 'id',
      firstName: 'Guest',
      lastName: 'lastName',
      email: 'email',
      password: 'password',
      phone: 11111111111,
      address: 'address');

  final navigationController = locator<NavigationService>();

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (errorMessage) {
      print("Error: $errorMessage");
    }
  }

  void showSnackbarSignUp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User Signed Up Successfully!'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Successful login, navigate to home or another screen
        navigationController.clearStackAndShowView(HomeView());
      }
    } catch (e) {
      // Handle login failure (e.g., display error message)
      print('Login Error: ${e}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed: $e'),
      ));
    }
  }

  Future<void> signInWithPhoneNumber(String phone) async {
    try {
      await _auth.signInWithPhoneNumber(phone);
      navigationController.navigateToSignupScreenView();
    } catch (errorMessage) {
      print("Error: $errorMessage");
    }
  }

  Future<void> signOut() async {
    try {
      _auth.signOut();
      userToken = UserModel.User(
          userId: 'id',
          firstName: 'Guest',
          lastName: 'lastName',
          email: 'email',
          password: 'password',
          phone: 11111111111,
          address: 'address');
      await locator.reset(dispose: true);
      setupLocator();
      setupDialogUi();
      setupBottomSheetUi();
    } catch (e) {
      print("The User cant be signed out due to $e");
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Reauthenticate the user (optional, if required by your security rules)
        // For example, if you want to ensure the user is the legitimate owner of the account
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: 'currentPassword', // User's current password
        );

        // Reauthenticate the user
        await user.reauthenticateWithCredential(credential);

        // Change the user's password
        await user.updatePassword(newPassword);

        print('Password changed successfully');
      } else {
        print('No user is currently signed in');
      }
    } catch (e) {
      print('Error changing password: $e');
    }
  }

  Future<void> setStateOfUser(String emailToSearch) async {
    print("In Function SetState");
    QuerySnapshot querySnapshot =
        await db.where('email', isEqualTo: emailToSearch).get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        UserModel.User user = UserModel.User.fromJson(data);
        userToken = user.copyWith(isLoggedIn: true);
        print('User ID: ${userToken?.userId}');
        print('Name: ${userToken?.firstName}');
        print('Email: ${userToken?.email}');
        print('Logged in status: ${userToken?.isLoggedIn}');
      });
    } else {
      print('User not found');
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        return user;
      }

      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  UserModel.User? getUser() {
    if (userToken != null) {
      return userToken;
    }
  }
}
