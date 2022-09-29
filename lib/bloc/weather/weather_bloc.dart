import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/weather/weather_cubit.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/weather.dart';

import '../../repo/weather_repo.dart';

abstract class WeatherEvent {
  WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  final CityLocation cityLocation;

  GetWeatherEvent(this.cityLocation);
}

class LocationSearchEvent extends WeatherEvent {
  final String cityName;

  LocationSearchEvent(this.cityName);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(InitialState()) {
    on<GetWeatherEvent>(_getWeatherEvent);
    on<LocationSearchEvent>(_getCity);
  }

  Future<void> _getWeatherEvent(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(LoadingState());
    try {
      WeatherData data =
          await weatherRepository.getWeatherFromRepo(event.cityLocation);
      emit(LoadedState(data));
    } on Exception {
      emit(ErrorState());
    }
  }

  Future<void> _getCity(LocationSearchEvent event, Emitter<WeatherState> emit) async {
    try {
      CityLocation location =
          await weatherRepository.getLocationFromRepo(event.cityName);
      emit(LoadingState());
      add(GetWeatherEvent(location));
    } on Exception {
      emit(ErrorState());
    }
  }
}
