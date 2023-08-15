import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Cart_Item.dart';
import 'package:shopfirst/styles/styles.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: SafeArea(
        child: Container(
            child: Column(children: [
          Center(
              heightFactor: 3,
              child: Text("Your Items",
                  style: AppTextStyles.headerStyle,
                  textAlign: TextAlign.center)),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
              ],
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  SizedBox(
                    height: 206,
                    width: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Items(3)"), Text("32")],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Shipping"), Text("32")],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Total"), Text("32")],
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                              onPressed: () => {}, child: Text("Checkout")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ])),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
