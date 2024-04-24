// ignore_for_file: non_constant_identifier_names, file_names
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
      final favortieProvider=Provider.of<ListProvider>(context);
      final product= favortieProvider.products;
        return Scaffold(
          body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  product: favortieProvider.products[index],
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
                 child:IconButton(
                      onPressed: () {
                        if(product[index].isfavorite) {
                          favortieProvider.removerfromfavorites(product[index].name);
                        }
                        else {
                          favortieProvider.addtofavorites(product[index].name);
                        }
                  },
                  icon:Icon(product[index].isfavorite?
                      Icons.favorite:
                      Icons.favorite_border),
                ),
                ),
                 ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    favortieProvider.products[index].image,
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
                        favortieProvider.products[index].name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       const SizedBox(height: 4.0),
                      Text(
                        favortieProvider.products[index].price.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
            ]
            ),
          ),
          ),
        );
  }
}
