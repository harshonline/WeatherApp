import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  CurrentWeather(
      {super.key,
      required this.location,
      required this.temperature,
      required this.error});
  final double temperature;
  final String? location;
  var error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.sunny,
          color: Colors.orange,
          size: 40,
        ),
        Text(
          '$temperature',
          style: const TextStyle(fontSize: 70),
        ),
        location != null
            ? error == 200
                ? Text(
                    '$location',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(176, 158, 158, 158)),
                  )
                : Text("The name $location is not valid please check again",
                    style: const TextStyle(color: Colors.red, fontSize: 20))
            : const Text(
                "Please Enter City Name",
              ),
      ],
    );
  }
}
