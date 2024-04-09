// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_app/Homepage.dart';
void main() {
  runApp(const Login_Screen());
}

class Login_Screen extends StatelessWidget {
       const Login_Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home:const loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<loginPage> {
   bool _isobscure=true;

  void initstate() {
      _isobscure=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children:<Widget> [

          Container(
            padding: const EdgeInsetsDirectional.only(top: 80.0),
            child: const Text("Login In",
              style:TextStyle(
                fontSize:50,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50.0,left: 35.0,right: 50.0,bottom: 20.0),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(),
                hintText: "Enter UserName",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0,left: 35.0,right: 50.0),
            child: TextField(
              obscureText:_isobscure,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 20.0,bottom: 20.0),
                  icon:  _isobscure? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _isobscure=!_isobscure;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
                hintText: "Enter Password",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(top: 20.0),
            child: FilledButton(
                onPressed: ()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Home_Screen())));
                },
                child: const Text("Login In")
            ),
          )
        ],
      ),
    );
  }
}
class showtoast extends loginPage {
  showtoast()
  {
    Fluttertoast.showToast(
        msg: "Login Succesfull",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.green,
    );
  }
}
