import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_it_up/profilepage/userdetails.dart';
import 'package:stock_it_up/splashscreen/login.dart';
import 'package:http/http.dart' as http;  
class AllGameOption extends StatefulWidget {
  const AllGameOption({Key? key}) : super(key: key);

  @override
  State<AllGameOption> createState() => _AllGameOptionState();
}

class _AllGameOptionState extends State<AllGameOption> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Game Option"),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
                SnackBar(
                  content: Text("Logout Successfully"),
                  duration: Duration(seconds: 10),
                );
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UserProfile()));
              },
              icon: Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: Text("All Game Option"),
      ),
    );
  }
}
