import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'order_completion_viewmodel.dart';

class OrderCompletionView extends StackedView<OrderCompletionViewModel> {
  const OrderCompletionView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(OrderCompletionViewModel viewModel) {
    Timer(Duration(seconds: 3), viewModel.handleNavigation);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    OrderCompletionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Order Completed.png"),
              SizedBox(height: 15),
              Text(
                "Order Placed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  OrderCompletionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderCompletionViewModel();
}
