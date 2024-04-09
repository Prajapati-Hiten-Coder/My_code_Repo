import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp( const Home_Screen());
}

class Home_Screen extends StatelessWidget {

   const Home_Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("HomeScreen"),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
         itemCount: 10,
          itemBuilder: (context, int index) => Card(
             child: ListTile(
              title: Text('$index'),
             ),
           ),
        ),
      ),
      );
  }
}
