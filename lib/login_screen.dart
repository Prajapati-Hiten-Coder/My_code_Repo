// ignore_for_file: camel_case_types
import 'package:google_fonts/google_fonts.dart';
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
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
          decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/backtheme.jpg"),
          fit: BoxFit.cover, // Adjust the fit as needed (cover, contain, etc.)
        ),
        ),
       child:Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child:Column(
              children:<Widget> [
          Container(
            padding: const EdgeInsetsDirectional.only(top: 80.0),
            child: Text("Login In",
              style:GoogleFonts.adamina(
                textStyle:const TextStyle(
                  fontSize:50,
                  color: Colors.black,
                ),
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0,left: 35.0,right: 50.0,bottom: 20.0),
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
                iconColor: Colors.lightBlueAccent,
                hintText: "Enter UserName",
                errorText: erroremail,
                fillColor: Colors.lightBlueAccent.shade100,
                filled: true,
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.black54),
              ),
            ),
          ),
          ),
            Container(
            padding: const EdgeInsets.only(left: 35.0,right: 50.0),
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
                fillColor: Colors.lightBlueAccent.shade100,
                filled: true,
                icon: const Icon(Icons.lock),
                iconColor: Colors.lightBlueAccent,
                suffixIcon: IconButton(
                  padding: const EdgeInsetsDirectional.only(end: 20.0),
                  icon:  _isobscure? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _isobscure=!_isobscure;
                    });
                  },
                ),
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
            child: ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                ),
                onPressed: ()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (const Home_Screen())));
                },
                child: const Text("Login In")
                ),
              ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 130.0)),
            ],
          ),
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

