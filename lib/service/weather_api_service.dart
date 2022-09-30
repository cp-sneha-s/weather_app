import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/weather.dart';
import '../model/location.dart';



String k= 'e5cafaa9bc8057cb91ca247efd8e0323';





class WeatherApiService {
 late WeatherData weatherData;

  Future<WeatherData> getWeatherData(CityLocation currentLocation) async {
    SharedPreferences pref= await SharedPreferences.getInstance();
    String apikey= pref.getString('weatherMap')??'';

    var lat = currentLocation.lat;
    var lon =currentLocation.lon;
    String weatherApi = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric';
    try {
      http.Response response = await http.get(Uri.parse(weatherApi));
      if (response.statusCode == 200) {
     weatherData  = WeatherData.fromJson(jsonDecode(response.body));
      }
    } on Exception catch (error) {
      throw Exception(error);
    }return weatherData;
  }
}
