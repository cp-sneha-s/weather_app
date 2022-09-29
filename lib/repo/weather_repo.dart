import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/location_api_service.dart';
import 'package:weather_app/service/weather_api_service.dart';

class WeatherRepository{
  WeatherApiService weatherApiService= WeatherApiService();
  LocationApiService locationApiService= LocationApiService();

  Future<WeatherData> getWeatherFromRepo(  CityLocation currentLocation)async{
  return  await weatherApiService.getWeatherData(currentLocation);
  }

  Future<CityLocation> getLocationFromRepo(String cityName  )async{
    return  await locationApiService.getLocation(cityName);
  }

}