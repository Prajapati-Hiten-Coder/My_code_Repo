

import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

   const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              height: MediaQuery.of(context).size.height*.50,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(product.image, width: 400,height: 100),

         ),
            Row(
              children: [
                const SizedBox(height: 16.0),
                Text(product.name),
               ]
            ),
            Row(
              children: [
                Text(product.price.toString()),
                ]
            ),
          ]
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
        },
        child: const Text('Add to Cart'),
      ),
    );
  }
}