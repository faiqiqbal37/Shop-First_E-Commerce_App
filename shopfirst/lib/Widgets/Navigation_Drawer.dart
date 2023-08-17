import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Cart_Item.dart';
import 'package:shopfirst/Widgets/Product_Card.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/ui/views/login_screen/login_screen_view.dart';
import 'package:shopfirst/ui/views/product_item/product_item_view.dart';
import 'package:shopfirst/ui/views/signup_screen/signup_screen_view.dart';
import 'package:stacked_services/stacked_services.dart';

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
              _authController.userToken == null ? Text("Hello Guest") :  Text('Hello ${_authController.userToken?.firstName }'),
              Divider(
                height: 30,
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text("Sign In"),
                      onTap: () => {_navigationController.clearStackAndShowView(LoginScreenView())},
                    ),
                    Text(
                      "  |  ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      child: Text("Register"),
                      onTap: () => {_navigationController.clearStackAndShowView(SignupScreenView())},
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
            title: Text('Categories'),
            onTap: () {
              _navigationController.navigateToProductsView();
// Handle navigation to the favorites screen
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('WishList'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              _navigationController.navigateToCartView();
            },
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Test Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductCard()),
              );
            },
          ),
          Divider(
            height: 30,
            color: Colors.black,
            thickness: 1,
          ),
          ElevatedButton(
              onPressed: () {
                _authController.signOut();
                _navigationController.navigateToLoginScreenView();

    },

              child: Text("Log Out"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)))))
        ],
      ),
    );
  }
}
