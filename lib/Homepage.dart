import 'package:flutter/material.dart';
  import 'package:my_flutter_app/ProductCard.dart';
import 'package:my_flutter_app/favorite.dart';
import 'package:my_flutter_app/list_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( const Home_Screen());
}

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

   @override
   State<Home_Screen> createState() => Loginpage();
}
class Loginpage extends State<Home_Screen> {



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>list_provider()),
        ],
      child:MaterialApp(
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
                 Navigator.push(context, MaterialPageRoute(builder:(context)=>const favorite_Screen()));
                },
                icon: const Icon(Icons.favorite))
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
        body: Consumer<list_provider>(
            builder: (BuildContext context, list_provider listmodel, Widget? child) =>GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
            itemCount: listmodel.product.length,
            itemBuilder: (context,index){
              return ProductCard(index: index);

            }),
        ),
      ),
        ),
    );
  }
}








