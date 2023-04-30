import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation(
      {super.key,
      required this.wind,
      required this.feelslike,
      required this.humidity,
      required this.pressure});
  final double wind;
  final int humidity;
  final double pressure;
  final double feelslike;
  @override
  Widget build(BuildContext context) {
    TextStyle property =
        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    TextStyle value =
        const TextStyle(fontSize: 15, fontWeight: FontWeight.w300);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wind",
                    style: property,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pressure",
                    style: property,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$wind",
                    style: value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$pressure",
                    style: value,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Humidity",
                    style: property,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Feels Like",
                    style: property,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$humidity",
                    style: value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$feelslike",
                    style: value,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
