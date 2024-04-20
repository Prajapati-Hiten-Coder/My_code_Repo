// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/productdetail.dart';
import 'package:my_flutter_app/list_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final int index;

  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<list_provider>(
      builder: (context, listmodel, child) {
        bool isFavorite = listmodel.isexist(index); // Get favorite state

        return Scaffold(

          body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  product: listmodel.product[index],
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                 child:Consumer<list_provider>(
                     builder: (context, listmodel, child)=>IconButton(
                      onPressed: () {
                      listmodel.isfav(index); // Toggle favorite state
                      isFavorite = !isFavorite; // Update local variable
                  },
                  icon: isFavorite
                      ?  const Icon(Icons.favorite,color: Colors.red)
                      :  const Icon(Icons.favorite_border_outlined),
                ),
                ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    listmodel.product[index].image,
                    fit: BoxFit.cover,
                    height: 85.0,
                    width: 180.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listmodel.product[index].name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        listmodel.product[index].price.toString(),
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
      },
    );
  }
}
