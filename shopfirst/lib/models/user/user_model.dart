// class User{
//   final String userId;
//   final String userName;
//   final String email;
//   final String password;
//   final double phone;
//   final String address;
//
//   User({required this.userId, required this.userName, required this.email, required this.password, required this.phone,
//       required this.address});
// }
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';



@freezed
class User with _$User {
  const factory User({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required double phone,
    required String address,
    @Default(false) bool isLoggedIn,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}