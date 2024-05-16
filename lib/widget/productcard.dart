import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/product_model.dart';
import 'package:my_flutter_app/Data/productdetail.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: GestureDetector(
          onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: product)));
          },
          child: Column(
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(product.image),
              ),
              Text(product.id),
              Text(product.name),
              Text(product.price),
            ],
          ),
          ),
        );
  }
}
