import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/Product.dart';
import 'package:provider/provider.dart';
final listprovider=ChangeNotifierProvider<ListProvider>(
    create: (ref)=> ListProvider()
);
class ListProvider extends ChangeNotifier{
  final List<Product> products=[
  Product(

      index: 1,
      image: 'assets/belt.jpg',
      name: 'product1',
      price: 500),
  Product(

      index: 2,
      image: 'assets/belt2.jpg',
      name: 'product2',
      price: 500),
  Product(

        index: 3,
        image: 'assets/belt3.jpg',
        name: 'product3',
        price: 500),
    Product(

        index: 4,
        image: 'assets/belt4.jpg',
        name: 'product4',
        price: 500),
    Product(

        index: 5,
        image: 'assets/belt5.jpg',
        name: 'product5',
        price: 500),
    Product(

        index: 6,
        image: 'assets/belt6.jpg',
        name: 'product6',
        price: 500),
    Product(

        index: 7,
        image: 'assets/belt7.jpg',
        name: 'product7',
        price: 500),
    Product(

        index: 8,
        image: 'assets/belt8.jpg',
        name: 'product8',
        price: 500),
    Product(

        index: 9,
        image: 'assets/belt9.jpg',
        name: 'product9',
        price: 500),
    Product(

        index: 10,
        image: 'assets/belt10.jpg',
        name: 'product10',
        price: 500),
  ];

 void addtofavorites(String itemContent){
   final itemindex=products.indexWhere((product) => product.name==itemContent);
   if(itemindex!=-1){
     products[itemindex].isfavorite=true;
   }
   notifyListeners();
 }
 void removerfromfavorites(String itemContent)
 {
   final itemindex=products.indexWhere((product) => product.name==itemContent);
   if(itemindex!=-1)
     {
       products[itemindex].isfavorite=false;
     }
   notifyListeners();
 }
 List<Product> getfavorite()
 {
   final favoriteitems=products.where((product) => product.isfavorite).toList();
   return favoriteitems;
 }
}

