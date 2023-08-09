import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(children: [
              Text('Hello User!'),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
// Handle navigation to the home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {
// Handle navigation to the favorites screen
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('WishList'),
            onTap: () {
// Handle navigation to the settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
// Handle navigation to the settings screen
            },
          ),
        ],
      ),
    );
  }
}
