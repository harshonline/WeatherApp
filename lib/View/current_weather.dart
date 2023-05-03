import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  CurrentWeather(
      {super.key,
      required this.location,
      required this.temperature,
      required this.error});
  final double temperature;
  final String? location;
  var error;

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  errorHandler() {
    widget.error = 200;
    Text(
      "The name ${widget.location} is not valid please check again",
      style: TextStyle(color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.error);
    print('${widget.location} efw');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.sunny,
          color: Colors.orange,
          size: 40,
        ),
        Text(
          '${widget.temperature}',
          style: TextStyle(fontSize: 70),
        ),
        widget.location != null
            ? widget.error == 200
                ? Text(
                    '${widget.location}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(176, 158, 158, 158)),
                  )
                : Text(
                    "The name ${widget.location} is not valid please check again",
                    style: TextStyle(color: Colors.red))
            : Text(
                "Please Enter City Name",
              ),
      ],
    );
  }
}
