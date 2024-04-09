import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp( Home_Screen(
    products: List<String>.generate(10, (i) => "Product List: $i"),
  ));
}

class Home_Screen extends StatelessWidget {
  final List<String> products;
   Home_Screen({super.key, required this.products});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
         itemCount: products.length,
          itemBuilder: (context,index) {
           return ListTile(
             title: Text('${products[index]}'),
           );
          },
        ),
      ),
      );
  }
}
