import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/models/user/user_model.dart';
import 'package:shopfirst/services/user_service.dart';
import 'package:stacked/stacked.dart';

class UserDetailViewModel extends BaseViewModel {
  final userService = locator<UserService>();
  late final User user;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


 void updateUserDetails(){
   Future<void> updateUser({
     required String userId,
     required double phone,
     required String name,
     required String address,
   }) async {
     userService.updateUser(userId: userId,name: name, phone: phone, address: address);

   }

 }
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length > 11) {
      return 'Phone number must not be more than 11 characters';
    }
    if(value.length < 11){
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

}
