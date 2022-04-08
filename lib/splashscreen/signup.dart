import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_it_up/homepage/allgameoption.dart';
import 'package:stock_it_up/splashscreen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signUp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: 'name',
              hintText: 'name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'email',
              hintText: 'email',
            ),
          ),
          SizedBox(
            height: 10,
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
              if (email.text.isNotEmpty &&
                  password.text.isNotEmpty &&
                  name.text.isNotEmpty) {
                await auth.createUserWithEmailAndPassword(
                    email: email.text, password: password.text);
                auth.currentUser!.updateDisplayName(name.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AllGameOption()));
              }
            },
            child: Text('Signup'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account"),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
