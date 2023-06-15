import 'package:flutter/material.dart';

TextStyle titleFont =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0);

Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3), // controls the position of the shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wind_power_rounded,
                            color: Colors.orange,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Wind Speed",
                            style: titleFont,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thermostat_rounded,
                            color: Colors.grey.shade800,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Pressure", style: titleFont),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          "$wind",
                          style: infoFont,
                        ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text("$pressure", style: infoFont)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
               decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3), // controls the position of the shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.water_rounded,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Humidity",
                            style: titleFont,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.fireplace_sharp,
                            color: Colors.red,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Feels Like", style: titleFont),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$humidity",
                        style: infoFont,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text("$feels_like", style: infoFont)
                    ],
                  ),
                ],
              ),
            ),
            ],
        ),
      ],
    ),
  );
}
