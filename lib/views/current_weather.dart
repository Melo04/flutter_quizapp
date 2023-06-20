import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                ? Colors.white
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
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$main",
          style: GoogleFonts.bitter(
            fontSize: 22.0,
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
