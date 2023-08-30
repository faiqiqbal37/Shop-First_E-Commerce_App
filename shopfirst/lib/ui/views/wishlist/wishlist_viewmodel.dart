import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class WishlistViewModel extends BaseViewModel {
  final db = FirebaseFirestore.instance.collection('wishlist');
  final authService = locator<AuthenticationService>();
  final cartService = locator<CartService>();


  final navigationController = locator<NavigationService>();

}
