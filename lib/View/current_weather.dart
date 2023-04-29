import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather(
      {super.key, required this.location, required this.temperature});
  final double temperature;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.sunny,
          color: Colors.orange,
          size: 40,
        ),
        Text(
          '$temperature',
          style: TextStyle(fontSize: 70),
        ),
        Text(
          location,
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(176, 158, 158, 158)),
        )
      ],
    );
  }
}
