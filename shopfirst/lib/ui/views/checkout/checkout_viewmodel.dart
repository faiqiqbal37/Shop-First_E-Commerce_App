import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/services/order_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/authentication_service.dart';

class CheckoutViewModel extends BaseViewModel {
  final authService = locator<AuthenticationService>();
  final cartService = locator<CartService>();
  final orderService = locator<OrderService>();

  Future<void> initializeOrder() async{
    orderService.initializeOrder();
  }

}
