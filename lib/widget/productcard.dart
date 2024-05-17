import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/Data/product_model.dart';
import 'package:my_flutter_app/Data/productdetail.dart';
import 'package:my_flutter_app/blocs/home_bloc/home_bloc.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final HomeBloc homeBloc;
  const ProductCard({super.key,required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: GestureDetector(
          onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: product)));
          },
          child: Column(
          children: [
          Padding(
          padding: const EdgeInsets.only(left: 3.0,top: 7.0) ,
          child:
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black)),
          child:Column(
            children: [
              ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  child: Image.asset(
                    product.image, // Use product.assert for the path
                    fit: BoxFit.cover,
                    height: 110.0,
                    width: 200.0,// Set image height
                ),
            ),


              Align(
                alignment: Alignment.bottomLeft,
                child:Text(product.name),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text(product.price),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    alignment: Alignment.bottomLeft,
                        onPressed: () {
                          homeBloc.add(FavroiteButtonClickEvent(product: product));
                        },
                        icon: const Icon(Icons.favorite)),

          ]
              )
                      ],
                    ),
                  ),
                ),
              ]

            ),
          ),
        );
  }
}
