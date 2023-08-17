import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/models/user/user_model.dart' as UserModel;

import '../app/app.locator.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('users');
   final db = FirebaseFirestore.instance.collection('users');


  UserModel.User? userToken = UserModel.User(userId: 'id', firstName: 'firstName', lastName: 'lastName', email: 'email', password: 'password', phone: 11111111111, address: 'address');

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

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final List<String> signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.contains('password')) {
        // Email exists, now attempt to sign in with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Successfully signed in
        print('Logged in as: ${email}');
      } else {
        // Email does not exist
        print('Email not registered');
      }
    } catch (e) {
      // Handle errors
      print('Login error: $e');
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

  Future<void> signOut() async{
    try{
      _auth.signOut();
      userToken = null;

    }
        catch(e){
          print("The User cant be signed out due to $e");
        }
  }

  Future<void> setStateOfUser(String emailToSearch) async {

    QuerySnapshot querySnapshot = await db.where('email', isEqualTo: emailToSearch).get();


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
    }  else {
      print('User not found');
    }
  }

}
