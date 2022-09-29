import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/location_api_service.dart';

import '../model/location.dart';


String apikey= 'e5cafaa9bc8057cb91ca247efd8e0323';


class WeatherApiService {
  final LocationApiService _locationApiService = LocationApiService();
 late WeatherData weatherData;

  Future<WeatherData> getWeatherData(CityLocation currentLocation) async {
    //CityLocation currentLocation = await _locationApiService.getLocation();
    var lat = currentLocation.lat;
    var lon =currentLocation.lon;
    String weatherApi = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric';
    try {
      http.Response response = await http.get(Uri.parse(weatherApi));
      if (response.statusCode == 200) {
     weatherData  = WeatherData.fromJson(jsonDecode(response.body));
        print(weatherData.name);
      }
    } on Exception catch (error) {
      throw Exception(error);
    }return weatherData;
  }
}
