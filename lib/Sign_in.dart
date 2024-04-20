import 'package:flutter/material.dart';
import 'package:my_flutter_app/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home:const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username =TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  final formkey=GlobalKey<FormState>();
  late String?  erroremail;
  late String? errorpass;
  late String? erroruser;
  bool _isobscure=true;
 bool stateofbutton=false;

  @override
  void initState()
  {
    super.initState();
    _isobscure=true;
    stateofbutton=false;
    errorpass=null;
    erroremail=null;
    erroruser=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
      alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/backtheme.jpg"),
            fit: BoxFit.cover, // Adjust the fit as needed (cover, contain, etc.)
          ),
         ),
        child: Form(
          key:formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children:<Widget>[
                Text("Sign In",
                  style:GoogleFonts.adamina(
                    textStyle:const TextStyle(
                      fontSize:50,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:10.0,left: 50.0,right:50.0),
                  child:  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        erroruser='Please write some Username';
                        return erroruser;
                      }
                      erroruser = null;
                      return erroruser;
                    },
                    controller: username,
                    decoration:  InputDecoration(
                      icon:  const Icon(Icons.account_circle_outlined),
                      iconColor: Colors.lightBlueAccent,
                      hintText: "Enter UserName",
                      fillColor: Colors.lightBlueAccent.shade100,
                      filled: true,
                      errorText: erroruser,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.black54),
                      ),
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
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
                    controller: email,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      iconColor: Colors.lightBlueAccent,
                      hintText: "Enter Email",
                      fillColor: Colors.lightBlueAccent.shade100,
                      filled: true,
                      errorText: erroremail,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.black54),
                      ),
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0,left: 50.0,right: 50.0),
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
                    controller: password,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      iconColor: Colors.lightBlueAccent,
                      fillColor: Colors.lightBlueAccent.shade100,
                      filled: true,
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
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: buildcheckbox(),
                ),
                 ElevatedButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: stateofbutton? ()
                    {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => (const loginPage())));
                      });
                    }:null,
                    child: const Text("Sign In",),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 60.0)),

              ],
            ),
          ),
        ),
        ),

    );
  }
  Widget buildcheckbox() => ListTile(
    leading: Checkbox(
      checkColor: Colors.black,
        activeColor: Colors.white,
        value: stateofbutton,
        onChanged: (value) {
          setState(() {
            stateofbutton= value!;
          });
        }
    ),
    title: const Text("I agree to terms and condition"),
    textColor: Colors.black,
  );
}
bool isEmailValid(String email) {
  // Basic email validation using regex
  // You can implement more complex validation if needed
  return RegExp(r'^[\w-.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
}

