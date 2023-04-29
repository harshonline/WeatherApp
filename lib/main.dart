import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> users = [];

  apiCalling() async {
    _counter++;
    var uri = Uri.parse('https://randomuser.me/api/?results=$_counter');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    setState(() {
      users = body['results'];
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.shop,
        ),

        title: Text('ghfghg'),
        centerTitle: true,
        actions: [Icon(Icons.add), Icon(Icons.add)],
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user['email'];
          return ListTile(
            title: Text(email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        apiCalling();
      }),
    );
  }
}
