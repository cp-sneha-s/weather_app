import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather.dart';
import '../../repo/weather_repo.dart';

abstract class WeatherState {}

class InitialState extends WeatherState {
  List<Object?> get props => [];
}

class LoadingState extends WeatherState{
  List<Object?> get props => [];
}

class LoadedState extends WeatherState{
  LoadedState(this.weatherData);
  WeatherData weatherData;
  @override
  List<Object?> get props => [weatherData];
}

class ErrorState extends WeatherState{
  @override
  List<Object?> get props => [];
}

class WeatherCubit extends Cubit<WeatherState>{
  String? cityName;
  WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository): super(
      InitialState());


  void getCurrentWeather()async{
    try{
      emit(LoadingState());
    //  final weatherData= await weatherRepository.getWeatherFromRepo();
    //  emit(LoadedState(weatherData));
    }catch(error){
      emit(ErrorState());
    }

  }
  void setCityName(String name){
    cityName= name;
    print('cityNAme: $cityName');
  }

}
