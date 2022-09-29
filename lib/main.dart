
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_cubit.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/screens/home_screen.dart';

import 'bloc/weather/weather_bloc.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocProvider<WeatherCubit>(
      create: (context)=>WeatherCubit(WeatherRepository()),
      child: const MaterialApp(
        title: 'Weather app',
        home:   HomeScreen()),
    );
  }
}

