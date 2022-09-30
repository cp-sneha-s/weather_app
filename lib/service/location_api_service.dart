import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/service/weather_api_service.dart';
import '../model/location.dart';

class LocationApiService {

  Future<CityLocation> getLocation(String city) async {
    SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setString('weatherMap', k);
    String apiKey=pref.getString('weatherMap')??"";

    late CityLocation cityLocation;
    String locationApi =
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$apiKey';
    try {
      http.Response response = await http.get(Uri.parse(locationApi));
      if (response.statusCode == 200) {
        List<dynamic> locationList= jsonDecode(response.body);
        List<CityLocation>  cityLocations =locationList.map((e) => CityLocation.fromJson(e)).toList();
        cityLocation= cityLocations[0];
      }
    } on Exception catch (error) {
      throw Exception(error);
    }return cityLocation;
  }

}
