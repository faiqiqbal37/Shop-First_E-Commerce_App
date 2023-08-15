import 'package:flutter/material.dart';

import 'Navigation_Drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  CustomScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Shop First"),
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.account_box),
              style: ButtonStyle(),
            ),
            IconButton(onPressed: () => {}, icon: Icon(Icons.shopping_cart))
          ]),
      body: body,
      drawer: MyDrawer(),
    );
  }
}
