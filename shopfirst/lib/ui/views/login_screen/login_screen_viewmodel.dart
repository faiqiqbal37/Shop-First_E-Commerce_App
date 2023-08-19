import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/models/user/user_model.dart' as UserModel;

class LoginScreenViewModel extends BaseViewModel {
  late final UserModel.User user;

  final formKey = GlobalKey<FormState>();

  final navigationController = locator<NavigationService>();
  final authService = locator<AuthenticationService>();
  final userService = locator<UserService>();

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

  // Future<void> getUser() async{
  //   user = await userService.getUser();
  //   print('The id is ${user.userId} and name is ${user.firstName}');
  // }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      authService.signInWithEmailAndPassword(email, password, context);
      authService.setStateOfUser(email);
    }
  }

  Future<void> signInWithPhoneNumber(String phone) async {
    authService.signInWithPhoneNumber(phone);
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null; // No validation errors
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // No validation errors
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
