import 'package:flutter/material.dart';

import '../app/app.locator.dart';
import '../services/product_service.dart';

class CategoryButton extends StatefulWidget {
  final String categoryName;
  bool isSelected = false;
  final Function() handleCallback;

  CategoryButton(
      {required this.handleCallback,
      required this.isSelected,
      required this.categoryName});

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  final productService = locator<ProductService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
            productService.isSelected = widget.isSelected;
            productService.selectedCategory = widget.categoryName;
            productService.getProductsBasedOnCategory(widget.categoryName);
            print(' Product Category${productService.selectedCategory}');
            widget.handleCallback();
          });
        },
        child: Text(widget.categoryName),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            widget.isSelected ? Colors.lightBlue : Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
