import 'package:flutter/material.dart';
import 'package:my_flutter_app/Product.dart';
import 'package:my_flutter_app/ProductCard.dart';
import 'package:my_flutter_app/Profilepage.dart';


void main() {
  runApp( const Home_Screen());
}

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

   @override
   State<Home_Screen> createState() => Loginpage();
}
class Loginpage extends State<Home_Screen> {

  final List<Product> products = [
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
         title: const Text("HomeScreen"),
          leading: Row(
            children:[
              Builder(
              builder: (context) =>
              IconButton(
                icon: const Icon(
                  Icons.menu,
                    ),
                 onPressed: ()=> Scaffold.of(context).openDrawer(),
               ),
                ),
              ]
            ),
          actions: [
            IconButton(
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder:(context)=>profilepage()));
                },
                icon: Icon(Icons.account_circle))
          ],
          ),

        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.arrow_back,
                  ),
                  title: const Text("Drawer"),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Home_Screen(),
                    ));
                    },
                ),
                const Divider(color: Colors.black,),
                const ListTile(
                  leading: Icon(
                      Icons.settings
                  ),
                  title: Text("Settings"),
                ),
                const Divider(color: Colors.black,),
                const ListTile(
                  leading: Icon(
                      Icons.star
                  ),
                  title: Text("Ratings"),
                ),
                const Divider(color: Colors.black,),
                const ListTile(
                  leading: Icon(
                      Icons.notifications,
                  ),
                  title: Text("Notifications"),
                ),
              ],
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
            itemCount: products.length,
            itemBuilder: (context,index){
              return ProductCard(
                  products: products, index: index);
            }),
        ),
    );
  }
}








