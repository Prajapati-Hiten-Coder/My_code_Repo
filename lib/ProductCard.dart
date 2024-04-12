// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Product.dart';
import 'package:my_flutter_app/productdetail.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
   List<Product> products;
   int index;
   late bool is_favorite=false;
   ProductCard({super.key, required this.products,required this.index}){
     products=products;
     index=index;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
            IconButton(
                onPressed: (){},
                icon: is_favorite? const Icon(Icons.favorite):const Icon(Icons.favorite_border_outlined))
        ],
      ),
        body:GestureDetector(
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
            Padding(
                padding: EdgeInsets.only(left: 20.0),
              child:ClipRRect(
                borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                child: Image.asset(
                 products[index].image, // Use product.assert for the path
                  fit: BoxFit.cover,
                  height: 85.0,
                  width: 150.0,// Set image height
            ),
          ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0,left: 20.0,bottom: 8.0,top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[index].name,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                 Text(products[index].price.toString(),
                  // Format price with two decimal places
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
             ),
             ),
            ],
           ),
          ),
        ),
      );
  }
}