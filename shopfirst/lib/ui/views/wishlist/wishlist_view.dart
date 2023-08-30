import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/models/wishlist/wishlist_model.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/Navigation_Drawer.dart';
import '../../../Widgets/Wishlist_Product_Card.dart';
import '../../../models/product/product_model.dart';
import 'wishlist_viewmodel.dart';

class WishlistView extends StackedView<WishlistViewModel> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WishlistViewModel viewModel,
    Widget? child,
  ) {
     return Scaffold(
      appBar: AppBar(title: Text("Wishlist"), actions: [
        IconButton(
          onPressed: () =>
          {viewModel.navigationController.navigateToUserDetailView()},
          icon: Icon(Icons.account_box),
          style: ButtonStyle(),
        ),
        Stack(alignment: Alignment.center, children: [
          IconButton(
              onPressed: () =>
              {viewModel.navigationController.navigateToCartView()},
              icon: Icon(Icons.shopping_cart)),
          Positioned(
            right: 2,
            top: 2,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${viewModel.cartService.cartProductsList.length}', // Replace with your actual product count
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
        // A demo function to add static products in firebase
      ]),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: viewModel.db.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Text('No products available');
                      } else {
                        List<Product> products = [];
                        final wishlist = snapshot.data!.docs
                            .map((doc) => Wishlist.fromJson(
                            doc.data() as Map<String, dynamic>))
                            .toList();
                        for(int i = 0; i < wishlist.length; i++){
                          for(int j = 0;  j < wishlist[i].products.length; j++){
                            if (wishlist[i].userId == viewModel.authService.userToken?.userId){
                              products.add(wishlist[i].products[j]);
                            }
                          }
                        }

                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final tempProduct = products.elementAt(index);
                            return WishlistProductCard(
                                handleCallback: (){},
                                product: tempProduct);
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  WishlistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WishlistViewModel();
}
