import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.verified_user),
        ),
        title: Text("Title"),
        subtitle: Text('Price'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.remove),
            ),
            Text("Quantity"),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
