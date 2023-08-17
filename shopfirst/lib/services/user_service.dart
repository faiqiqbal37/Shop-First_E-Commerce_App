import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/user/user_model.dart';

class UserService {
  // final DatabaseReference _userRef =
  // FirebaseDatabase.instance.ref().child('users');

  final db = FirebaseFirestore.instance;

  late final User user;
  late final String userId;

  void setUserId(String id) {
    userId = id;
  }

  Future<void> setUser() async {

  }

  Future<void> findUserByEmail(String emailToSearch) async {

    QuerySnapshot querySnapshot = await db.collection('users').where('email', isEqualTo: emailToSearch).get();


    if (querySnapshot.docs.isNotEmpty) {
      Map<dynamic, dynamic> usersMap = querySnapshot.docs as Map;
      usersMap.forEach((key, value) {
        User user = User.fromJson(Map<String, dynamic>.from(value));
        print('User ID: ${user.userId}');
        print('Name: ${user.firstName}');
        print('Email: ${user.email}');
        print('------------');
      });
    } else {
      print('User not found');
    }
  }



  void setUserAfterLogin() {

  }



  Future<void> addUser({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required double phone,
    required String address,
  }) async {
     user = User(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        address: address);
    try {
      await db.collection("users")
          .add(user.toJson()); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<void> updateUser({
    required String userId,
    required String name,
    required double phone,
    required String address,
  }) async {
    try {
      await db.collection("users").doc(userId)
          .set(
          {
            'name': name,
            'phone': phone.toString(),
            'address': address
          }

      ); // Use .toJson() function
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }

  Future<void> getCurrentUser() async {

  }
}
