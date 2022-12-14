extension WeatherIcon on int{
String getWeatherIcon(){
  if (this < 300) {
    return '๐ฉ';
  } else if (this < 400) {
    return '๐ง';
  } else if (this < 600) {
    return 'โ๏ธ';
  } else if (this < 700) {
    return 'โ๏ธ';
  } else if (this < 800) {
    return '๐ซ';
  } else if (this == 800) {
    return 'โ๏ธ';
  } else if (this <= 804) {
    return 'โ๏ธ';
  } else {
    return '๐คทโ';
  }
  }
}

extension WeatherMessage on int{
  String getWeatherMessage(){
    if (this > 25) {
      return 'It\'s ๐ฆ time';
    } else if (this > 20) {
      return 'Time for shorts and ๐';
    } else if (this < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}