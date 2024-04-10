import 'package:flutter/material.dart';
import 'package:my_flutter_app/Product.dart';
import 'package:my_flutter_app/productdetail.dart';

class ProductCard extends StatelessWidget {
   List<Product> products;
   int index;
   ProductCard({required this.products,required this.index}){
     this.products=products;
     this.index=index;
   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: products[index]),
        ),
      );
    },
      child:Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.0)
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            child: Image.asset(
              products[index].image, // Use product.assert for the path
              fit: BoxFit.cover,
              height: 130.0, // Set image height
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[index].name,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                 Text('${products[index].price.toString()}',
                  // Format price with two decimal places
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
         ],
        ),
      ),
    );
  }
}