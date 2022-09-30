import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/screens/home_screen.dart';


void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_)=>WeatherBloc(WeatherRepository()),
      child:  MaterialApp(
          title: 'Weather app',
          home:   const HomeScreen()
      ),
    );
  }
}

