import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:harsh_chaudhary/View/additional_information.dart';
import 'package:harsh_chaudhary/View/current_weather.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CurrentWeather(location: "London", temperature: "20"),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Additional Information",
            style: TextStyle(fontSize: 20),
          ),
          const Divider(),
          const AdditionalInformation(
            wind: 50,
            humidity: 12,
            feelslike: 32,
            pressure: 1,
          )
        ],
      ),
      drawer: const Drawer(),
    );
  }
}












// apiCalling() async {
//     _counter++;
//     var uri = Uri.parse('https://randomuser.me/api/?results=$_counter');
//     final response = await http.get(uri);
//     final body = jsonDecode(response.body);
//     setState(() {
//       users = body['results'];
//     });
//   }