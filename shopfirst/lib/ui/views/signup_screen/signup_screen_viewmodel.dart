import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/models/user/user_model.dart' as UserModel;
import 'package:uuid/uuid.dart';

import '../../../services/authentication_service.dart';

class SignupScreenViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final uuid = Uuid();
  bool obscureText = true;

  final navigationController = locator<NavigationService>();
  final authService = locator<AuthenticationService>();
  final userService = locator<UserService>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Exception errorMessage = Exception();

  String userId = '';
  String _email = '';
  String _password = '';
  String _phone = '';

  String get email => _email;

  void toggleObscureText() {
    obscureText = !obscureText;
    rebuildUi();
  }

  set email(String value) {
    _email = value;
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    authService.signUpWithEmailAndPassword(email, password);
  }

  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required double phone,
    required String address,
  }) async {
    userService.addUser(
        firstName: firstName,
        lastName: lastName,
        address: address,
        email: email,
        password: password,
        phone: phone);
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

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length > 11) {
      return 'Phone number must not be more than 11 characters';
    }
    if (value.length < 11) {
      return 'Enter a valid number';
    }
    return null; // No validation errors
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Address';
    }
    if (value.length < 11) {
      return 'Enter a Valid Street Address';
    }
    return null; // No validation errors
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null; // No validation errors
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field cant be empty';
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
