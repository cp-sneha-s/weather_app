import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/weather.dart';

import '../repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(InitialState());

  void getCurrentWeather(String city)async{
    emit(LoadingState());
    try{
      CityLocation location= await weatherRepository.getLocationFromRepo(city);
      WeatherData data= await weatherRepository.getWeatherFromRepo(location);
      emit(LoadedState(data));
    }on Exception catch(error){
      emit(ErrorState(error.toString()));
    }
  }

}


abstract class WeatherState{}
class InitialState extends WeatherState{}
class LoadingState extends WeatherState{}
class LoadedState extends WeatherState{
  WeatherData weatherData;
  LoadedState(this.weatherData);
}
class ErrorState extends WeatherState{
  String error;
  ErrorState(this.error);
}
