import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/location.dart';

class LocationApiService {

  Future<CityLocation> getLocation(String city) async {
    late CityLocation cityLocation;
    String locationApi =
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=e5cafaa9bc8057cb91ca247efd8e0323';
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
