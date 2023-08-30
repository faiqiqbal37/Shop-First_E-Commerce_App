import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/order_service.dart';

class OrderCompletionViewModel extends BaseViewModel {
  final navigationController = locator<NavigationService>();
  final cartService = locator<CartService>();
  final orderService = locator<OrderService>();

  void handleNavigation() {
    navigationController.clearStackAndShowView(HomeView());
    cartService.cartProductsList = [];
  }
}
