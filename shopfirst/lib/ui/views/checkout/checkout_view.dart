import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/Cart_Item.dart';
import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
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
            Divider(),
            ListTile(
              title: Text('Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Text('\PKR: ${viewModel.cartService.totalCartPrice}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 16),
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${viewModel.authService.userToken?.address}'),
            SizedBox(height: 16),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Cash'),
            SizedBox(height: 32),
            viewModel.cartService.cartProductsList.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      viewModel.initializeOrder();
                      viewModel.navigationService
                          .navigateToOrderCompletionView();
                    },
                    child: Text('Place Order'),
                  )
                : Text("Please Enter Items In Cart First",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckoutViewModel();
}
