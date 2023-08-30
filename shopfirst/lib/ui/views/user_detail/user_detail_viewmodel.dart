import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/models/user/user_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserDetailViewModel extends BaseViewModel {
  final userService = locator<UserService>();
  final authService = locator<AuthenticationService>();
  final navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();

  User user = User(
      userId: 'id',
      firstName: 'Guest',
      lastName: 'lastName',
      email: 'email',
      password: 'password',
      phone: "11111111111",
      address: 'address');

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> updateUser({
    required String userId,
    required String phone,
    required String firstname,
    required String lastname,
    required String address,
  }) async {
    {
      {
        userService.updateUser(
            userId: userId,
            firstname: firstname,
            lastname: lastname,
            phone: phone,
            address: address);
      }
    }
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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field cant be empty';
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

  void clearFields() {
    firstNameController.text = '';
    lastNameController.text = '';
    addressController.text = '';
    phoneController.text = '';
  }
}
