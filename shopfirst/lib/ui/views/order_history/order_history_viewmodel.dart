import 'package:shopfirst/models/order/order_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/order_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class OrderHistoryViewModel extends BaseViewModel {
  final orderService = locator<OrderService>();
  final authService = locator<AuthenticationService>();

}
