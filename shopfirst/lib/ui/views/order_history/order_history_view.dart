import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/OrderCard.dart';
import 'package:stacked/stacked.dart';

import 'order_history_viewmodel.dart';

class OrderHistoryView extends StackedView<OrderHistoryViewModel> {
  const OrderHistoryView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(OrderHistoryViewModel viewModel) {
    viewModel.orderService.getAllOrders(viewModel.authService.userToken!.userId);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    OrderHistoryViewModel viewModel,
    Widget? child,
  ) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Order Summaries'),
      ),
      body: Container(
        height: 500 ,
        child: ListView.builder(
          itemCount: viewModel.orderService.orders.length,
          itemBuilder: (context, index) {
            final order =
            viewModel.orderService.orders.elementAt(index);
            return OrderCard( order: order,);
          },
        ),
      ),
    );
  }

  @override
  OrderHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderHistoryViewModel();
}
