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
        ChangeNotifierProvider(create: (context)=>ListProvider()),
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
    final favoriteprovider=Provider.of<ListProvider>(context);
    final favoriteitems=favoriteprovider.getfavorite();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body:GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: favoriteitems.length,
    itemBuilder: (context,index) {
      final item = favoriteitems[index];
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
                item.image,
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
                    item.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item.price as String,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
      ),
    );
  }
}


