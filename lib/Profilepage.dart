// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
void main()
{
  runApp(const Profilepage());
}
class Profilepage extends StatelessWidget
{
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(),
      home: const profilepage(),
    );
  }
}
class profilepage extends StatelessWidget {
  const profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.black12,
          padding: const EdgeInsets.only(left: 130.0),
          height: 200,
          child:const Row(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/belt.jpg'),
              ),
          ],
      ),
        ),
     );
  }
}
