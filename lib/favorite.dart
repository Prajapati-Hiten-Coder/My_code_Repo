// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:my_flutter_app/list_provider.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(const favorite_Screen());
}
class favorite_Screen extends StatelessWidget {
  const favorite_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context)=>list_provider()),
    ],
    child:MaterialApp(
      theme: ThemeData(
      ),
      home:const favorite_page(),
    ),
    );
  }
}
class favorite_page extends StatefulWidget
{
  const favorite_page({super.key});
  @override
  State<favorite_page> createState() => favorite_state();
}
class favorite_state extends State<favorite_page>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Consumer<list_provider>(
        builder: (BuildContext context, list_provider listmodel, Widget? child) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
           ),
          itemCount: listmodel.favlist_product.length,
          itemBuilder: (context, index) {
            return Container(
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
              ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
                child: Image.asset(
                  listmodel.product[index].image,
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 150.0,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
                    listmodel.product[index].name,
                  style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                  Text(
                  listmodel.product[index].price.toString(),
                  style: const TextStyle(color: Colors.grey),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                  child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){}
                      ),
                  ),
                      ],
                    ),
                  ),

                ]
              ),
            );
          },
        ),
      ),
    );
  }
}


