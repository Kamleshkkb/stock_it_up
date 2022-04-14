import 'dart:convert';

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
  final String apiUrl =
      "https://financialmodelingprep.com/api/v3/stock-screener?marketCapMoreThan=1000000000&betaMoreThan=1&volumeMoreThan=10000&sector=Technology&exchange=NASDAQ&dividendMoreThan=0&limit=100&apikey=yourapikey";
  Future<List<dynamic>> fetchStockData() async {
    var result = await http.get(Uri.parse(apiUrl));
    var results = json.decode(result.body);
    return json.decode(result.body);
  }

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
      body: Container(
        padding: EdgeInsets.only(bottom: 42.0),
        child: FutureBuilder<List<dynamic>>(
          future: fetchStockData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(3),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 9.0),
                            Text(
                              '${snapshot.data[index]['symbol']}',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 9.0),
                            Text(
                              "${snapshot.data[index]['companyName']}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Container(
                          height: 40,
                          width: 80,
                          color: Colors.green,
                          child: Center(
                              child: Text(
                            "${snapshot.data[index]['price']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }
          },
        ),
      ),
    );
  }
}
