import 'dart:html';

import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation(
      {super.key,
      required this.wind,
      required this.feelslike,
      required this.humidity,
      required this.pressure});
  final double wind;
  final double humidity;
  final double pressure;
  final double feelslike;
  @override
  Widget build(BuildContext context) {
    TextStyle property =
        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    TextStyle value =
        const TextStyle(fontSize: 15, fontWeight: FontWeight.w300);
    return Column(
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
                Text(
                  "$feelslike",
                  style: value,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
