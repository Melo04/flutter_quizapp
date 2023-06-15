import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather (String? location) async{
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9ab2c519dc256ae6e4a63d92a8891218&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}