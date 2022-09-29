import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_cubit.dart';
import 'package:weather_app/core/extension.dart';
import 'package:weather_app/repo/weather_repo.dart';

import '../bloc/weather/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


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
      body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Something went wrong')));
              });

              return Container();
            } else if (state is LoadedState) {
              final weatherData = state.weatherData;
              int temp = weatherData.temp!.toInt();
              int condition = weatherData.cod;
              String weatherIcon = condition.getWeatherIcon(condition);
              String weatherMessage = temp.getWeatherMessage(temp);
              return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "$temp°",
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
                        "$weatherMessage in ${weatherData.name}!",
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Looks like: ${weatherData.description}!",
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ));
            }
            return Container();
          },
        ),
    );
  }
}
