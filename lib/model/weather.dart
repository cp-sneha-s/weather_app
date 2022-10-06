class WeatherData {
  double latitude;
  double longitude;
  String? name;
  double temp;
  double? windSpeed;
  String? description;
  String? country;
  int cod;

  WeatherData(
      {required this.latitude,
      required this.longitude,
      this.name,
      required this.temp,
      this.windSpeed,
      this.description,
      this.country,
      required this.cod});

  factory WeatherData.fromJson(Map<String, dynamic> map) => WeatherData(
      latitude: map['coord']['lat'],
      longitude: map['coord']['lon'],
      name: map['name'],
      country: map['sys']['country'],
      temp: map['main']['temp'],
      windSpeed: map['wind']['speed'],

      description: map['weather'][0]['description'],
    cod:map['weather'][0]['id'],);
}
