extension WeatherIcon on int{
String getWeatherIcon(int condition){
  if (this < 300) {
    return '🌩';
  } else if (this < 400) {
    return '🌧';
  } else if (this < 600) {
    return '☔️';
  } else if (this < 700) {
    return '☃️';
  } else if (this < 800) {
    return '🌫';
  } else if (this == 800) {
    return '☀️';
  } else if (this <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
  }
}

extension WeatherMessage on int{
  String getWeatherMessage(int temp){
    if (this > 25) {
      return 'It\'s 🍦 time';
    } else if (this > 20) {
      return 'Time for shorts and 👕';
    } else if (this < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}