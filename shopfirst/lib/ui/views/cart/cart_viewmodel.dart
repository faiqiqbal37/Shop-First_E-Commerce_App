import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/order_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/product/product_model.dart';
import '../../../services/cart_service.dart';

class CartViewModel extends BaseViewModel {
  final cartService = locator<CartService>();
  final authService = locator<AuthenticationService>();
  final navigationService = locator<NavigationService>();
  final orderService = locator<OrderService>();

  double totalCartPrice = 0;

  Future<void> initializeCart() async {
    if (cartService.initializerFlag == false) {
      cartService.initializeCart();
      cartService.initializerFlag = true;
    }
  }

  void increaseQuantity(String productId) {
    cartService.increaseQuantity(productId);
  }

  void handleClick() {
    rebuildUi();
  }

  // double calculateTotalPrice() {
  //   final List<Product> list = cartService.cartProductsList;
  //
  //   list.forEach((element) {
  //     totalCartPrice = element.totalPriceInCart + totalCartPrice;
  //   });
  //   orderService.totalPriceOfOrder = totalCartPrice;
  //   return totalCartPrice;
  // }

  void deleteFromCart(Product product) {
    cartService.removeFromCart(product);
    rebuildUi();
  }
}
