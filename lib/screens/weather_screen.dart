import 'package:flutter/material.dart';
import 'package:weather_app/core/extension.dart';
import 'package:weather_app/model/weather.dart';


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
      body: Container()
    );
  }
}




class WeatherCard extends StatelessWidget {
  WeatherData weatherData;
   WeatherCard({Key? key,required this.weatherData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String temp= weatherData.temp.toStringAsFixed(2);
    int temperature= weatherData.temp.toInt();
    String weatherMessage= temperature.getWeatherMessage();
    int condition= weatherData.cod;
    print(condition);
    String weatherIcon= condition.getWeatherIcon();
    return Card(
        shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 3.0),
    borderRadius: BorderRadius.circular(10.0),
    ),
    color: Colors.white60,
    elevation: 10.0,
    shadowColor: Colors.yellow,
    child:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weatherIcon,style: const TextStyle(fontSize: 100),
            ),
            Container(height: 50,),
            Text(
              '$temp࠾',
              style: const TextStyle(fontSize: 25),
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
        ))
    );}
}

