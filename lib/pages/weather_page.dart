import 'package:flutter/material.dart';
import 'package:fluttergdsc/views/additional_information.dart';
import '../model/weather_model.dart';
import '../services/weather_api_client.dart';
import '../views/current_weather.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Kuala Lumpur");
  }

  String getBackgroundImage() {
    if(data != null) {
      if(data!.main == "Clouds") {
        return "assets/image/cloudy.jpg";
      } else if(data!.main == "Rain") {
        return "assets/image/rain2.jpg";
      } else {
        return "assets/image/sunny.jpg";
      }
    } else {
      return "assets/image/sunny.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(getBackgroundImage()),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Weather App",
                      style: GoogleFonts.poppins(
                        fontSize: 32.0,
                        //white
                        color: Color(0xFFf9f9f9),
                        fontWeight: FontWeight.bold,
                      )),
                  currentWeather(
                      "${data!.main}", "${data!.temp}", "${data!.cityName}"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Additional Details",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 15.0,
                  ),
                  additionalInformation("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}"),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
