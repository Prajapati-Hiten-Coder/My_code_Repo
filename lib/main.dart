import 'package:flutter/material.dart';
import 'package:my_flutter_app/login_screen.dart';


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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key:formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child:SingleChildScrollView(
            child: Column(
          children:<Widget>[
            const Text("Sign In",
              style:TextStyle(
                fontSize:50,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0,left: 50.0,right:50.0),
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
                  icon: const Icon(Icons.account_circle_outlined),
                  border: const OutlineInputBorder(),
                  hintText: "Enter UserName",
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
                  border: const OutlineInputBorder(),
                  hintText: "Enter Email",
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
                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 20.0),
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
             padding: const EdgeInsetsDirectional.only(start: 20.0),
             child: buildcheckbox(),
           ),
            FilledButton(
                onPressed: stateofbutton? ()
                {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (const loginPage())));
                  });
                }:null,
                child: const Text("Sign In")
              ),
            ],
         ),
        ),
      ),
    );
  }
  Widget buildcheckbox() => ListTile(
    leading: Checkbox(
        value: stateofbutton,
        onChanged: (value) {
          setState(() {
            stateofbutton= value!;
          });
        }
    ),
    title: const Text("I agree to terms and condition"),
  );
}
bool isEmailValid(String email) {
  // Basic email validation using regex
  // You can implement more complex validation if needed
  return RegExp(r'^[\w-.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
}

