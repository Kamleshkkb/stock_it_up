import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_it_up/homepage/allgameoption.dart';
import 'package:stock_it_up/splashscreen/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'email',
              hintText: 'email',
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              labelText: 'password',
              hintText: 'password',
            ),
          ),
          FlatButton(
            color: Colors.blueAccent,
            onPressed: () async {
              if (email.text.isNotEmpty && password.text.isNotEmpty) {
                await auth.signInWithEmailAndPassword(
                    email: email.text, password: password.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AllGameOption()));
              }
            },
            child: Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New User "),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: Text('Signup'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
