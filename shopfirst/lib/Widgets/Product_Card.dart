import 'package:flutter/material.dart';

import '../models/product/product_model.dart';

class ProductCard extends StatelessWidget {
  // final Product product;
  //
  // ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Image(image: NetworkImage("https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aXBob25lfGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60"),),
        title: Text("Title"),
        subtitle: Text('Price'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text("Buy"),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
