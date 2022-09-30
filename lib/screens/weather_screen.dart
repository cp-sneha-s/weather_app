import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/core/extension.dart';
import 'package:weather_app/model/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int temp = 30;
  int condition = 100;
  String weatherIcon = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (BuildContext context, WeatherState state) {
          if (state is InitialState) {
            return Container();
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            WeatherData weatherData = state.weatherData;
            temp = weatherData.temp!.toInt();
            condition = weatherData.cod;
            weatherIcon = condition.getWeatherIcon();
            weatherMessage = temp.getWeatherMessage();

            return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$temp°',
                          style: const TextStyle(fontSize: 25),
                        ),
                        Text(
                          weatherIcon,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$weatherMessage in ${weatherData.name}!',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Looks like: ${weatherData.description}!',
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ));
          } else if (state is ErrorState) {
            String error = state.error;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error)));
          }
          return Container();
        }));
  }
}
