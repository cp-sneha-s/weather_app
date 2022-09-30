import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/weather.dart';

import '../repo/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(InitialState()){
    on<SearchEvent>(handleSearchEvent);
    on<GetWeatherEvent>(handleWeatherEvent);

  }

  void handleWeatherEvent(GetWeatherEvent event,Emitter<WeatherState> emit)async{
    try{
      WeatherData data= await weatherRepository.getWeatherFromRepo(event.location);
      emit(LoadedState(data));
    }on Exception catch(error){
      emit(ErrorState(error.toString()));
    }
  }



  void handleSearchEvent(SearchEvent event,Emitter<WeatherState> emit)async{
    try{
      CityLocation location= await weatherRepository.getLocationFromRepo(event.cityName);
      emit(LoadingState());
      add(GetWeatherEvent(location));
    }on Exception catch(error){
      emit(ErrorState(error.toString()));
    }
  }

}

abstract class WeatherEvent{}

class SearchEvent extends WeatherEvent{
  String cityName;

  SearchEvent(this.cityName);
}

class GetWeatherEvent extends WeatherEvent{
  CityLocation location;
  GetWeatherEvent(this.location);
}
