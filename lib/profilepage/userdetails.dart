import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : " + auth.currentUser!.displayName.toString()),
            SizedBox(
              height: 20,
            ),
            Text("Email : " + auth.currentUser!.email.toString()),
          ],
        ),
      ),
    );
  }
}
