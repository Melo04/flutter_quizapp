class Weather{
  String? cityName;
  String? main;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather({this.cityName, this.main, this.temp, this.wind, this.humidity, this.feels_like, this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    main = json['weather'][0]['main'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
  }
}