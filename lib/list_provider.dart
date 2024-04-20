import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/Product.dart';
class list_provider extends ChangeNotifier{
  List<Product> favlist_product=[
    Product(
        index: 1,
        image: 'assets/belt.jpg',
        name: 'product1',
        price: 500),
  ];
final List<Product> product=[
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
   void isfav(int index) {
    if (isexist(index)) {
      removeproduct(index);
    } else {
     addproduct(index);
    }
    notifyListeners(); // Notify listeners about the change
  }
  bool isexist(int index) {
    final productToCheck = product[index];
    return favlist_product.contains(productToCheck);// Check if product exists in favorites
  }
   addproduct(int index)
  {
    favlist_product.add(product[index].index as Product);
    favlist_product.add(product[index].price as Product);
    favlist_product.add(product[index].image as Product);
    favlist_product.add(product[index].name as Product);
  }
  removeproduct(int index)
  {
    favlist_product.remove(product[index].index as Product);
    favlist_product.remove(product[index].price as Product);
    favlist_product.remove(product[index].image as Product);
    favlist_product.remove(product[index].name as Product);
  }



}