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
  final formkey=GlobalKey<FormState>();
   bool _isobscure=true;
   String? errorpass;
   String? erroremail;

  void initstate() {
      _isobscure=true;
      errorpass=null;
      erroremail=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child:Column(
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
            child: TextFormField(
              validator: (value)
              {
                if(value!.isEmpty){
                  erroremail= 'Please enter email id';
                  return erroremail;
                }
                else if(!isEmailValid(value)){
                  erroremail= 'Please enter valid Email id';
                  return erroremail;
                }
                erroremail=null;
                return null;
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.account_circle_outlined),
                border: const OutlineInputBorder(),
                hintText: "Enter UserName",
                errorText: erroremail,
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.black54),
              ),
            ),
          ),
          ),
            Container(
            padding: const EdgeInsets.only(top: 10.0,left: 35.0,right: 50.0),
            child: TextFormField(
              validator: (value)
              {
                if(value!.isEmpty){
                  errorpass='Please Enter password';
                  return errorpass;
                }
                else if(value.length<8){
                  errorpass= 'Password must be 8 characters long';
                  return errorpass;
                }
                errorpass=null;
                return null;
              },
              obscureText:_isobscure,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 20.0,bottom: 20.0,top: 20.0),
                  icon:  _isobscure? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _isobscure=!_isobscure;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
                hintText: "Enter Password",
                errorText: errorpass,
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.black54),
                  ),
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
                      MaterialPageRoute(builder: (context) => (const Home_Screen())));
                },
                child: const Text("Login In")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class showtoast extends loginPage {
  showtoast({super.key})
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
bool isEmailValid(String email) {
  // Basic email validation using regex
  // You can implement more complex validation if needed
  return RegExp(r'^[\w-.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
}

