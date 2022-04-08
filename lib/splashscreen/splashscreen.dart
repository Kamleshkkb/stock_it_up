import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:stock_it_up/homepage/allgameoption.dart';
import 'package:stock_it_up/splashscreen/login.dart';

class Splash2 extends StatelessWidget {
  FirebaseAuth auth=FirebaseAuth.instance;
@override
Widget build(BuildContext context) {
	return SplashScreen(
	seconds: 6,
	navigateAfterSeconds:  auth.currentUser==null ?LoginScreen():AllGameOption(),
	title: new Text('Stock It Up',textScaleFactor: 2,),
	image: new Image.asset('assets/applogo.jpg'),
	loadingText: Text("Loading"),
	photoSize: 100.0,
	loaderColor: Colors.blue,
	);
}
}
