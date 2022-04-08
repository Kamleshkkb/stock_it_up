import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'splashscreen/splashscreen.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Splash Screen',
	theme: ThemeData(
		primarySwatch: Colors.green,
	),
	home: Splash2(),
	debugShowCheckedModeBanner: false,
	);
}
}
