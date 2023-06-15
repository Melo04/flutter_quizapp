import 'package:flutter/material.dart';

Widget currentWeather(String main, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            main == "Clouds"
                ? Icons.wb_cloudy_rounded
                : (main == "Rain"
                    ? Icons.cloudy_snowing
                    : Icons.wb_sunny_rounded),
            color: main == "Clouds"
                ? Colors.blue
                : (main == "Rain" ? Colors.grey.shade800 : Colors.orange),
            size: 64.0),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 46.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$location",
          style: TextStyle(
            fontSize: 19.0,
            color: Colors.grey.shade900,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$main",
          style: TextStyle(
            fontSize: 20.0,
            color: main == "Clouds" ? Colors.blue : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
