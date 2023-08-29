import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';
import '../../../services/user_service.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final userService = locator<UserService>();
  final authService = locator<AuthenticationService>();
  final navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void clearFields(BuildContext context) {
    navigationService.navigateToUserDetailView();
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

  Future<void> changePassword(String newPassword) async {
    if (formKey.currentState!.validate()) {
      authService.changePassword(newPassword);
      userService.updateUserPassword(
          userId: authService.userToken!.userId, password: newPassword);
    }
  }
}
