import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Cart_Item.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/styles/styles.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/Navigation_Drawer.dart';
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
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
            child: Column(children: [
          Center(
              heightFactor: 3,
              child: Text("Your Items",
                  style: AppTextStyles.headerStyle,
                  textAlign: TextAlign.center)),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.cartService.cartProductsList.length,
              itemBuilder: (context, index) {
                final product =
                    viewModel.cartService.cartProductsList.elementAt(index);
                return CartItem(
                  cartItem: product,
                  handleClick: viewModel.handleClick,
                );
              },
            ),
          ),
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
                            children: [
                              Text(
                                  "Items(${viewModel.cartService.cartProductsList.length})"),
                              Text(viewModel.cartService.cartProductsList
                                          .length ==
                                      0
                                  ? "PKR: 0"
                                  : "PKR: ${viewModel.cartService.totalCartPrice}")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Shipping"), Text("PKR: 150")],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total"),
                              Text(viewModel
                                      .cartService.cartProductsList.isNotEmpty
                                  ? "PKR: ${viewModel.cartService.totalCartPrice + 150}"
                                  : "PKR: 0")
                            ],
                          ),
                        ),
                        Container(
                            child: viewModel.authService.userToken!.isLoggedIn
                                ? ElevatedButton(
                                    onPressed: () {
                                      viewModel.navigationService
                                          .navigateToCheckoutView();
                                      viewModel.initializeCart();
                                    },
                                    child: Text("Checkout"))
                                : ElevatedButton(
                                    onPressed: () => viewModel.navigationService
                                        .navigateToLoginScreenView(),
                                    child: Text("Login To Proceed")))
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
