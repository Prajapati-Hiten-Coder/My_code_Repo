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
      title: 'Flutter Demo',
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
  bool _isobscure=true;
  bool stateofbutton=false;
  void initstate()
  {
    super.initState();
    _isobscure=true;
    stateofbutton=false;
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
              child:  TextField(
                controller: username,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(),
                  hintText: "Enter UserName",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0,left: 50.0,right: 50.0),
              child: TextField(
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

