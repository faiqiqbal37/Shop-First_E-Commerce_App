import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shopfirst/Widgets/Cart_Item.dart';
import 'package:shopfirst/Widgets/Product_Card.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/ui/views/login_screen/login_screen_view.dart';
import 'package:shopfirst/ui/views/product_item/product_item_view.dart';
import 'package:shopfirst/ui/views/signup_screen/signup_screen_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/models/user/user_model.dart' as UserModel;

class MyDrawer extends StatelessWidget {
  final _navigationController = locator<NavigationService>();
  final _authController = locator<AuthenticationService>();

  String guest = "Guest";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(children: [
              Image.network(
                  height: 60,
                  width: 60,
                  "https://cdn.pixabay.com/photo/2017/03/05/08/38/character-2117975_1280.png"),
              _authController.userToken == null
                  ? Text("Hello Guest")
                  : Text('Hello ${_authController.userToken?.firstName}'),
              Divider(
                height: 30,
                color: Colors.black,
                thickness: 1,
              ),
              _authController.userToken!.isLoggedIn
                  ? SizedBox(
                      height: 1,
                    )
                  : SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text("Sign In"),
                            onTap: () => {
                              _navigationController
                                  .clearStackAndShowView(LoginScreenView())
                            },
                          ),
                          Text(
                            "  |  ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            child: Text("Register"),
                            onTap: () => {
                              _navigationController
                                  .clearStackAndShowView(SignupScreenView())
                            },
                          ),
                        ],
                      ),
                    )
            ]),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              _navigationController.navigateToHomeView();
// Handle navigation to the home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Products'),
            onTap: () {
              _navigationController.navigateToProductsView();
// Handle navigation to the favorites screen
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('WishList'),
            onTap: () {_navigationController.navigateToWishlistView();},
          ),
          _authController.userToken!.isLoggedIn ? ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              _navigationController.navigateToOrderHistoryView();
            },
          ) : Divider(),
          Divider(
            height: 30,
            color: Colors.black,
            thickness: 1,
          ),
          _authController.userToken!.isLoggedIn
              ? ElevatedButton(
                  onPressed: () {
                    _authController.signOut();
                    _navigationController.navigateToLoginScreenView();
                    //Restart.restartApp();
                  },
                  child: Text("Logout"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))))
              : SizedBox()
        ],
      ),
    );
  }
}
