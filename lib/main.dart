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
  var cityName = TextEditingController();
  String? location;

  var checkError;
  double wind = 0;
  double temp = 0;
  double feelsLike = 0;
  int humidity = 0;
  double pressure = 0;
  bool appbar = false;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  apiCalling() async {
    var uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=20daabc382f34826a9733743233004&q=${widget.cityName.text}&aqi=no');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        widget.checkError = response.statusCode;
        widget.wind = body["current"]["wind_kph"];
        widget.temp = body["current"]["temp_c"];
        widget.feelsLike = body["current"]["feelslike_c"];
        widget.humidity = body["current"]["humidity"];
        widget.pressure = body["current"]["pressure_mb"];
        widget.location = body["location"]["name"];
      });
    } else {
      setState(() {
        widget.checkError = response.statusCode;
        widget.location = widget.cityName.text;
        widget.wind = 0;
        widget.temp = 0;
        widget.feelsLike = 0;
        widget.humidity = 0;
        widget.pressure = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          // "Weather App",
          "Weather App",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (widget.appbar == false) {
                  widget.cityName.clear();
                }
                setState(() {
                  widget.appbar = !widget.appbar;
                  if (widget.cityName.text.isNotEmpty) {
                    apiCalling();
                  }
                });
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          widget.appbar
              ? TextFormField(
                  autocorrect: true,
                  controller: widget.cityName,
                  decoration:
                      const InputDecoration(hintText: "Search by City Name"),
                  style: const TextStyle(fontSize: 20),
                  onFieldSubmitted: (value) {
                    setState(() {
                      widget.appbar = !widget.appbar;
                      if (widget.cityName.text.isNotEmpty) {
                        print(widget.cityName.text);
                        apiCalling();
                      }
                    });
                  },
                )
              : const SizedBox(
                  height: 0,
                  width: 10,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentWeather(
                  location: widget.location,
                  temperature: widget.temp,
                  error: widget.checkError),
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
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: apiCalling),
    );
  }
}
