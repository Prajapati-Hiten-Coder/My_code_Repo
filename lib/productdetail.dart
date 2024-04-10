import 'dart:ffi';

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
          children:[
            Container(
              height: MediaQuery.of(context).size.height*.50,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(product.image, width: 400,height: 100),

         ),
            Row(
              children: [
                SizedBox(height: 16.0),
                Text(product.name),
               ]
            ),
            Row(
              children: [
                Text(product.price.toString()
              ),
                ]
            )

          ]
        ),
      ),
    );
  }
}