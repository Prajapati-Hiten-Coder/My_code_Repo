import 'package:flutter/material.dart';
import 'package:my_flutter_app/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

   ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(product.image, width: double.infinity),
            const SizedBox(height: 16.0),
            Text(product.name),
            Text(product.price.toString()),

          ],
        ),
      ),
    );
  }
}