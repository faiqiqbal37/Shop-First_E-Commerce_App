import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/user/user_model.dart';

class UserService {
  // final DatabaseReference _userRef =
  // FirebaseDatabase.instance.ref().child('users');

  final db = FirebaseFirestore.instance;
  final Uuid uuid = Uuid();
  Future<void> findUserByEmail(String emailToSearch) async {
    QuerySnapshot querySnapshot = await db
        .collection('users')
        .where('email', isEqualTo: emailToSearch)
        .get();

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

  Future<void> addUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required double phone,
    required String address,
  }) async {
    String id = uuid.v4();
    User user = User(
        userId: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        address: address);
    try {
      await db
          .collection("users")
          .doc(id)
          .set(user.toJson()); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<void> updateUser({
    required String userId,
    required String firstname,
    required String lastname,
    required double phone,
    required String address,
  }) async {
    try {
      await db.collection("users").doc(userId).update({
        'firstName': firstname,
        'lastName': lastname,
        'phone': phone,
        'address': address
      }); // Use .toJson() function
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }

  Future<void> updateUserPassword({
    required String userId,
    required String password,
  }) async {
    try {
      await db.collection("users").doc(userId).update({
        'password': password,
      }); // Use .toJson() function
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }
}
