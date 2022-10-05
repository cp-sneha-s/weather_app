import 'package:flutter/material.dart';



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
        body:Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '$temp࠾',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text('',
                     //TODO: Replace it with $weatherIcon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '',
                 //TODO Replace it with '$weatherMessage in ${weatherData.name}!',

                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('',
                  //TODO: Replace it with 'Looks like: ${weatherData.description}!',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            )),
    );
  }
}
