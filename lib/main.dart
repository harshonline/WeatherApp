import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:harsh_chaudhary/View/additional_information.dart';
import 'package:harsh_chaudhary/View/current_weather.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  double wind = 0;
  double temp = 0;
  double feelsLike = 0;
  int humidity = 0;
  double pressure = 0;
  String cityName = "georgia";
  bool appbar = false;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  apiCalling() async {
    print('start');
    var uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=20daabc382f34826a9733743233004&q=${widget.cityName}&aqi=no');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    setState(() {
      widget.wind = body["current"]["wind_kph"];
      widget.temp = body["current"]["temp_c"];
      widget.feelsLike = body["current"]["feelslike_c"];
      widget.humidity = body["current"]["humidity"];
      widget.pressure = body["current"]["pressure_mb"];
    });
    print('end');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          // "Weather App",
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.appbar = !widget.appbar;
                });
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          widget.appbar
              ? TextFormField(
                  decoration: InputDecoration(hintText: "Search by City Name"),
                  style: TextStyle(fontSize: 20),
                )
              : SizedBox(
                  height: 0,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentWeather(
                  location: widget.cityName, temperature: widget.temp),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Additional Information",
            style: TextStyle(fontSize: 20),
          ),
          const Divider(color: Colors.black),
          AdditionalInformation(
            wind: widget.wind,
            humidity: widget.humidity,
            feelslike: widget.feelsLike,
            pressure: widget.pressure,
          )
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: apiCalling),
    );
  }
}
